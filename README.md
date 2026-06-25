# sid-digi

A self-contained reference for **C64 SID "digi" (PCM / sample) playback
techniques** — how a 1982 sound chip with no sample DAC was made to play
digitized audio — with **first-principles Python** that takes a WAV and plays it
back through a real SID emulation ([`pyresidfp`](https://pypi.org/project/pyresidfp/)
/ reSIDfp), reproducing each technique's mechanism. No external playroutine
binary sits in the playback path: the chip is driven one register write at a
time, at the technique's native sub-frame rate, exactly as the C64 would.

It also ships **reverse-engineering (RE) artifacts** — fresh disassembly,
decompilation and register-oracle traces of representative digi `.sid` tunes —
plus the scripts to regenerate them.

> Digi reproduction is **inherently lossy** (4-bit DACs, oscillator
> resynthesis, sub-frame jitter). Tests assert *native-fidelity* reproduction
> (pitch tracked, distinct level resolution, non-silence) — **never byte-exact**.
> Where a technique cannot be reproduced cleanly from first principles, the gap
> is documented precisely rather than hidden.

## Why SID digi is special: the sub-frame cadence

A SID player is normally called **once per video frame** (~50 Hz PAL). Frame
samplers / dumpers (e.g. `siddump`) read the SID state once per play call.

Digis defeat this: they stream PCM amplitude to a SID register at a **sub-frame
rate** (typically 4–47 kHz), clocked by a CIA timer or NMI/raster interrupt —
*hundreds of writes per frame*. A once-per-frame oracle records only the last
value each frame and sees a flat line, which is why frame dumpers "miss" digis.
The pure-Python tracer in `scripts/sidtrace_fallback.py` makes this concrete: it
reports writes-per-frame, and a digi shows a flood of `$D418` (or pulse-width)
writes per frame.

## Techniques reference table

| Module | Technique | Audio register(s) | Bit depth | Native rate | Chip | Distinct mechanism? |
|---|---|---|---|---|---|---|
| `d418_4bit` | 4-bit `$D418` master-volume PCM | `$D418` low nibble | 4-bit | ~8 kHz (CIA/NMI) | 6581* | baseline |
| `mahoney_8bit` | Mahoney 8-bit ("Musik Run/Stop") | `$D418` (+ 3 voices + filter) | ~8-bit | ~32–47 kHz (NMI) | 8580/6581 | yes (DC-env + table) |
| `pulse_dc` | Test-bit / pulse-width DC pseudo-sample | `$D402/3` on TEST-frozen voice | ~6–8-bit DC | ~11 kHz | 8580/6581 | yes (PW DC) |
| `galway` | Galway-style packed-nibble `$D418` | `$D418` low nibble | 4-bit (2/byte) | ~8 kHz (CPU loop) | 6581* | no (= `$D418`, CPU-paced) |
| `frodigi` | Frodigi oscillator resynthesis | per-voice freq/ctrl + `$D418` vol | n/a (resynth) | 50 Hz (per frame) | 8580 | yes (not PCM) |

\* 6581 default because its non-linear master-volume DAC + DC offset makes
`$D418` writes audible even with no voice sounding; see the 6581-vs-8580 notes
per technique.

### Players grouped by mechanism

The mechanism is documented once; players that share it are listed under it:

- **4-bit `$D418` PCM** (`d418_4bit`): Rob Hubbard game digi-drums, the bulk of
  `*Digi*` 4-bit streamers, FutureComposer digi, **speech / Huelsbeck-style**
  voice players (same `$D418` DAC, lower rate / smaller samples), Voicetracker.
- **Galway** (`galway`): Martin Galway's Arkanoid / Combat School / Game Over
  drums — the same `$D418` 4-bit mechanism, but nibble-packed and timed by a
  CPU busy-wait loop (~125/130 cycles/sample) rather than an interrupt.
- **Mahoney 8-bit** (`mahoney_8bit`): Pex 'Mahoney' Tufvesson's "Musik
  Run/Stop" / 8bitDigi, and late Frodigi (7/8) which adopt the same `$D418` +
  amplitude-table method.
- **Test-bit / pulse-width DC** (`pulse_dc`): the DC-offset "pseudo-sample"
  primitive (also a building block of Mahoney's static setup).
- **Oscillator resynthesis** (`frodigi`): classic Frodigi 1–5 — *not* a PCM
  digi at all; it resynthesizes audio through the SID oscillators per frame.

## Per-technique details

### `d418_4bit` — 4-bit `$D418` volume-register PCM

The SID master volume is the low 4 bits of `$D418`. The path from that DAC to
the audio output is itself a signal: changing the volume steps the output even
with no voice audibly playing. A digi player ignores the oscillators and writes
a stream of 4-bit PCM codes into `$D418` at a CIA/NMI sub-frame rate, turning a
4-bit volume control into a 4-bit DAC.

- **6581**: the master-volume DAC is non-linear and there is a strong DC offset
  / "DAC click"; the technique works precisely because each write thumps the
  output rail. This is the historically dominant chip for `$D418` digi.
- **8580**: the DAC is cleaner and the offset was removed, so naive `$D418`
  writes are much quieter without a sounding voice — which is exactly why the
  Mahoney technique keeps three voices running.

reSIDfp reproduces a 6581 `$D418` tone faithfully (spectral peak lands on the
input pitch). The test asserts the reproduced pitch is within a few percent.

### `mahoney_8bit` — Mahoney 8-bit (the "Musik Run/Stop" technique, 8580)

Lifts the 4-bit `$D418` DAC to ~8-bit by adding finer levels *underneath* the
volume bits. Static setup (verbatim from Mahoney's white paper):

| Register | Value | Meaning |
|---|---|---|
| `$D404/B/12` | `$49` | pulse + TEST bit, all 3 voices → frozen DC |
| `$D405/C/13` | `$0F` | attack=0, decay=15 |
| `$D406/D/14` | `$FF` | sustain=15, release=15 |
| `$D415/D416` | `$FF` | filter cutoff maxed |
| `$D417` | `$03` | route voices 1+2 through the filter |
| `$D418` | table | per-sample: one write, value from a 256-entry table |

The three TEST-frozen voices sit at fixed DC offsets; the upper nibble of
`$D418` (filter mode/routing) decides whether those offsets reach the output
through the filter (gain ~ −1, not *exactly* −1). So each of the 256 possible
`$D418` bytes lands on a measurably distinct output level. The levels are **not
linear**, so Mahoney *measured* all 256 on real hardware and built a
translation table.

We reproduce that calibration from first principles: `calibrate()` measures the
*emulated* SID's output for every one of the 256 `$D418` bytes and inverts the
result into a playback table. On both chip models this yields **>250 distinct
output levels** from the 4-bit register — near-8-bit resolution, demonstrated by
the test.

> **Honesty note.** Mahoney's own documentation says "8-bit"; the popular
> "8.6-bit" figure is folklore and is *not* in the primary source. What is
> verifiable — and what this code shows — is "8-bit input → 256-entry measured
> table → one `$D418` write", giving far more than 16 levels.

### `pulse_dc` — test-bit / pulse-width DC pseudo-sample

Setting a voice's TEST bit (control-reg bit 3) freezes its oscillator at phase
0; a frozen **pulse** voice then outputs a DC level controlled by its 12-bit
pulse-width register. Rewriting the pulse width per sub-frame tick makes one
voice a DC-steppable amplitude source, leaving master volume free.

`calibrate()` confirms the mechanism: sweeping the pulse width yields a wide,
monotonic, many-level DC swing (the test asserts >16 distinct levels and a
usable range).

> **Documented gap.** At high per-sample update rates, reSIDfp's output coupling
> (the DC-blocking high-pass that models the C64's audio output capacitor)
> removes the slowly-varying DC component, so a *tonal* AC reproduction does not
> survive the way it does for `$D418`. The DC-level mechanism is real and
> measured here; faithful high-rate tonal playback from the pulse-width DC trick
> alone is **not** reproduced, and the test reflects that (it asserts distinct
> calibrated levels + non-silence, not pitch). This is an honest first-principles
> limitation, not a tuned-away result.

### `galway` — Galway-style packed-nibble `$D418`

Mechanistically the **same** 4-bit `$D418` PCM as `d418_4bit`, packaged
differently: sample bytes hold *two* 4-bit samples (hi nibble then lo), and the
cadence is a **CPU busy-wait loop** (alternating ~125 / ~130 cycles/sample,
~8 kHz) rather than an interrupt — so it blocks the CPU while a sample plays.
`encode()` expresses ticks in real CPU cycles and `render()` clocks the SID by
those cycle gaps, reproducing the cadence exactly. The test reproduces the
input pitch and verifies the nibble packing round-trips and the cadence.

### `frodigi` — Frodigi oscillator resynthesis (classic Frodigi 1–5)

The original Frodigi (by Algorithm / Naveed Khugiani) is **not** a `$D418` PCM
streamer — it is **additive oscillator resynthesis**: once per 50 Hz frame it
picks per-voice oscillator settings (the original chooses from ~512 predefined
notes + a 4-bit volume) so the summed SID output approximates the source. The
hallmark is extreme compression at the cost of an oscillator-coloured timbre.

We reproduce the spirit from first principles: per frame, autocorrelation pitch
detection picks the fundamental for voice 1, RMS sets master volume, and a real
SID sawtooth renders it. The test asserts the fundamental is tracked within ~8%
across 220–440 Hz. (Late Frodigi 7/8 instead adopt the Mahoney `$D418` method —
see `mahoney_8bit`.)

## Usage

Install (editable, with dev + RE extras):

```sh
pip install -e ".[dev,re]"
```

Render a WAV through any technique (writes a 44.1 kHz WAV):

```sh
python -m siddigi.d418_4bit    in.wav out_d418.wav    --chip 6581
python -m siddigi.mahoney_8bit in.wav out_mahoney.wav --chip 8580
python -m siddigi.pulse_dc     in.wav out_pulse.wav   --chip 8580
python -m siddigi.galway       in.wav out_galway.wav  --chip 6581
python -m siddigi.frodigi      in.wav out_frodigi.wav --chip 8580
```

Programmatically:

```python
from siddigi import mahoney_8bit
stream = mahoney_8bit.encode("in.wav", chip_model="8580")  # [(tick, reg, val), ...]
pcm = mahoney_8bit.render(stream, "8580")                  # int16 numpy array
```

## Reverse-engineering artifacts

`re/<player>/` holds, for each representative digi tune, the fresh `.sid`
(copied from HVSC), a Ghidra disassembly (`disasm.asm`), decompilation
(`decompile.c`), symbol map (`symbols.json`), a `siddump.txt` frame oracle, and
a pure-Python register trace (`siddump_fallback.txt`). The tunes RE'd:

| Player dir | Tune | Mechanism |
|---|---|---|
| `re/mahoney_8bit/` | Mahoney — *Smold* (8580) | Mahoney 8-bit |
| `re/d418_4bit/` | MC — *Nemesis the Warlock* | classic 4-bit `$D418` |
| `re/galway/` | Alfatech — *Galway-tune* | Galway-style `$D418` |
| `re/frodigi/` | Khugiani — *FRODIGI* (8580 RSID) | Frodigi resynthesis |

### Regenerate

The artifacts are produced by
[deplayroutine](https://github.com/anarkiwi/deplayroutine) (Ghidra-in-Docker),
falling back to a pure-Python register tracer when Docker is unavailable:

```sh
# full RE via deplayroutine (needs Docker + the anarkiwi/deplayroutine image)
python scripts/regen_re.py

# force the pure-Python fallback oracle (no Docker)
python scripts/regen_re.py --fallback

# one player only
python scripts/regen_re.py --player mahoney_8bit
```

Override locations with env vars: `HVSC` (HVSC root), `DEPLAYROUTINE`
(deplayroutine checkout).

> The pure-Python fallback runs the player on a [py65](https://pypi.org/project/py65/)
> 6502 emulator and logs SID-page writes. It captures the init/setup writes and
> (for once-per-frame players) the per-frame stream, demonstrating the
> writes-per-frame digi signature. It does **not** model CIA/NMI interrupt
> hardware, so for interrupt-driven RSID players the actual streaming happens in
> a handler the fallback cannot fire — use deplayroutine for those (its static
> Ghidra disasm shows the handler regardless).

## Development

```sh
black --check siddigi tests
pytest
```

## License

Apache-2.0 — see [LICENSE](LICENSE).
