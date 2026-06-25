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
  Run/Stop" / 8bitDigi — the measured 256-entry `$D418` amplitude-table method.
- **Test-bit / pulse-width DC** (`pulse_dc`): the DC-offset "pseudo-sample"
  primitive (also a building block of Mahoney's static setup).
- **Oscillator resynthesis** (`frodigi`): classic Frodigi (Algorithm/Algotech)
  — *not* a PCM digi at all; it resynthesizes audio through the SID oscillators
  per frame.

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

Sources: the canonical primary write-up is *C=Hacking* #20, ["The C64 Digi"](http://unusedino.de/ec64/technical/c=hacking/ch20.html)
(Harbron / Hársfalvi / Judd) — "load each 4-bit sample, and store it in the
volume register (`$d418`)", giving "16 different amplitudes (0–15)". codebase64's
own code page is the [NMI Sample player](http://web.archive.org/web/20250102201533/http://codebase64.org/doku.php?id=base%3Anmi_sample_player)
(Wayback; the live site is currently down). The 6581-vs-8580 DC/DAC distinction is
documented empirically in C=Hacking #20 (writing `$0f` to `$d418` "raised the
output voltage to 6.15 volts" on a 6581; "no significant DC offset" on the 8580)
and modelled in [reSID `filter.cc`](https://raw.githubusercontent.com/daglem/reSID/master/src/filter.cc)
(separate `opamp_voltage_6581[]`/`opamp_voltage_8580[]` and per-model
`voice_DC_voltage`); the 8580 "digi boost" hardware hack is noted in
[reSID `sid.cc`](https://raw.githubusercontent.com/daglem/reSID/master/src/sid.cc).

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

Sources: the primary source is Mahoney's own white paper, ["Technical details of
Musik Run/Stop — Playing 8-bit samples at 44.1kHz on a computer from 1982"](https://livet.se/mahoney/c64-files/Musik_RunStop_Technical_Details_by_Pex_Mahoney_Tufvesson_v2.pdf)
(Pex 'Mahoney' Tufvesson, Lund, 2014; see also his [timeline page](https://livet.se/mahoney/timeline.php)).
It describes the `$49` TEST-frozen voices, the max-cutoff filter routing with
gain "almost −1", and the 256-entry per-chip amplitude table "telling us 'if you
want this output amplitude, write value X into `$d418`'" — verified against the
paper, which says **"8-bit"** throughout and **never** "8.6 bit". The demo it
debuted in is on CSDB: ["Musik Run/Stop"](https://csdb.dk/release/?id=129090)
(Datastorm 2014).

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

Sources: the TEST bit's behaviour is documented in the *C64 Programmer's
Reference Guide* (p. 463: "The TEST bit, when set to a one, resets and locks
Oscillator 1 at zero"), quoted and applied to digi in *C=Hacking* #20,
["The C64 Digi"](http://unusedino.de/ec64/technical/c=hacking/ch20.html), which
describes combining "the oscillator-test bits and configurable pulse width to
perform pulse-width modulation" — and credits PWM digi with "about 7.5 bits …
for a stock C64". A clear secondary write-up is Bumbershoot Software's
["Digital Sound Playback on the C64"](https://bumbershootsoft.wordpress.com/2022/12/30/digital-sound-playback-on-the-c64/).

### `galway` — Galway-style packed-nibble `$D418`

Mechanistically the **same** 4-bit `$D418` PCM as `d418_4bit`, packaged
differently: sample bytes hold *two* 4-bit samples (hi nibble then lo), and the
cadence is a **CPU busy-wait loop** (alternating ~125 / ~130 cycles/sample,
~8 kHz) rather than an interrupt — so it blocks the CPU while a sample plays.
`encode()` expresses ticks in real CPU cycles and `render()` clocks the SID by
those cycle gaps, reproducing the cadence exactly. The test reproduces the
input pitch and verifies the nibble packing round-trips and the cadence.

Sources: the exact driver is dissected in the XeNTaX ["SID DIGI Play Routines"](https://c64.xentax.com/index.php/16-sid-digi-play-routines)
reference (Galway's *Combat School* driver: "Samples: 4-bit `$D418`", high/low
nibble unpacking, "Each sample is played at a rate of 125 and 130 cycles,
alternating", and "Samples are not timed using Timer A or B" — i.e. a CPU-paced
busy-wait, not an interrupt). Martin Galway's [CSDB scener page](https://csdb.dk/scener/?id=8132);
a representative tune is [*Combat School*](https://csdb.dk/sid/?id=13266)
(Ocean, 1987).

### `frodigi` — Frodigi oscillator resynthesis (classic Frodigi 1–5)

The original Frodigi (by Algorithm / Naveed Khugiani) is **not** a `$D418` PCM
streamer — it is **additive oscillator resynthesis**: once per 50 Hz frame it
picks per-voice oscillator settings (the original chooses from ~512 predefined
notes + a 4-bit volume) so the summed SID output approximates the source. The
hallmark is extreme compression at the cost of an oscillator-coloured timbre.

We reproduce the spirit from first principles: per frame, autocorrelation pitch
detection picks the fundamental for voice 1, RMS sets master volume, and a real
SID sawtooth renders it. The test asserts the fundamental is tracked within ~8%
across 220–440 Hz. (Later Frodigi versions move away from pure oscillator
resynthesis: per its CSDB notes, [Frodigi 7](https://csdb.dk/release/?id=152629)
mixes sines digitally and drives the SID synth with "a custom calibrated
Pulsewidth table … to give 4 unrestricted amplitudes per channel" — a
pulse-width amplitude table, *not* the Mahoney `$D418` table.)

Sources: the original [FRODIGI](https://csdb.dk/release/?id=131019) (Algorithm /
Algotech, Onslaught, 2014) — "Free Running Oscillator Digi", recreating audio
from "free running sid oscillators … in 3 channels and a master volume … using
only a few raster lines per frame", which confirms the oscillator-resynthesis
mechanism. (The author handle is "Algorithm / Algotech" on CSDB; the real name
"Khugiani Naveed" comes from the HVSC SID metadata.)

## References

External, primary-where-possible sources backing the mechanism claims above.
Every URL here was verified by fetching it while writing this document (June
2026); where the canonical host is offline, a Wayback Machine snapshot is given.

**General SID / digi**

- *C=Hacking* #20, "The C64 Digi" (Harbron, Hársfalvi, Judd) — the canonical
  primary article on C64 digi; covers `$D418` PCM, the 6581/8580 DC distinction,
  and pulse-width modulation: <http://unusedino.de/ec64/technical/c=hacking/ch20.html>
  (readable mirror: <https://gist.github.com/munshkr/30f35e39905e63876ff7>).
- reSID (Dag Lem), the reference SID emulation: filter / DAC model in
  <https://raw.githubusercontent.com/daglem/reSID/master/src/filter.cc> and the
  8580 "digi boost" note in <https://raw.githubusercontent.com/daglem/reSID/master/src/sid.cc>.
- Bumbershoot Software, "Digital Sound Playback on the C64" (secondary
  overview): <https://bumbershootsoft.wordpress.com/2022/12/30/digital-sound-playback-on-the-c64/>.

**`d418_4bit` — 4-bit `$D418` PCM**

- codebase64, "NMI Sample player" (Wayback; live site currently down):
  <http://web.archive.org/web/20250102201533/http://codebase64.org/doku.php?id=base%3Anmi_sample_player>.
- C=Hacking #20 (above) for the `$D418` method and the 6581 6.15 V DC-offset
  measurement vs the 8580.

**`mahoney_8bit` — Mahoney 8-bit ("Musik Run/Stop")**

- Pex 'Mahoney' Tufvesson, "Technical details of Musik Run/Stop — Playing 8-bit
  samples at 44.1kHz on a computer from 1982" (primary author paper, Lund 2014):
  <https://livet.se/mahoney/c64-files/Musik_RunStop_Technical_Details_by_Pex_Mahoney_Tufvesson_v2.pdf>
  (author site: <https://livet.se/mahoney/timeline.php>). The paper says "8-bit"
  throughout and never "8.6 bit".
- CSDB, "Musik Run/Stop" (Datastorm 2014): <https://csdb.dk/release/?id=129090>.

**`pulse_dc` — test-bit / pulse-width DC pseudo-sample**

- *C64 Programmer's Reference Guide*, p. 463 (TEST bit "resets and locks
  Oscillator 1 at zero"), as applied to digi in C=Hacking #20 (above), which
  rates PWM digi at "about 7.5 bits".

**`galway` — Galway-style packed-nibble `$D418`**

- XeNTaX, "SID DIGI Play Routines" — dissects Galway's *Combat School* driver
  (4-bit `$D418`, nibble packing, 125/130-cycle busy-wait, no Timer A/B):
  <https://c64.xentax.com/index.php/16-sid-digi-play-routines>.
- CSDB: Martin Galway <https://csdb.dk/scener/?id=8132>; *Combat School*
  <https://csdb.dk/sid/?id=13266>.

**`frodigi` — Frodigi oscillator resynthesis**

- CSDB, "FRODIGI" (Algorithm / Algotech, Onslaught, 2014) — "Free Running
  Oscillator Digi": <https://csdb.dk/release/?id=131019>. Frodigi 7 (later
  pulse-width-table / sine-mixing variant, *not* the Mahoney `$D418` method):
  <https://csdb.dk/release/?id=152629>.

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

`re/<player>/` holds, for each representative digi tune, a Ghidra disassembly
(`disasm.asm`), decompilation (`decompile.c`), symbol map (`symbols.json`), a
`siddump.txt` frame oracle, and a pure-Python register trace
(`siddump_fallback.txt`). The raw `.sid` binaries are HVSC copyright works and
are **not** committed; `SOURCE.txt` records each tune's HVSC path and
`scripts/fetch_sids.py` downloads it on demand into the gitignored `.sidcache/`.
The tunes RE'd:

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

The tunes are first fetched from a public HVSC mirror into the gitignored
`.sidcache/` (`scripts/fetch_sids.py`); `regen_re.py` calls the fetcher itself,
so a fresh clone needs only network access.

```sh
# download the RE'd tunes into .sidcache/ (done automatically by regen_re.py)
python scripts/fetch_sids.py

# full RE via deplayroutine (needs Docker + the anarkiwi/deplayroutine image)
python scripts/regen_re.py

# force the pure-Python fallback oracle (no Docker)
python scripts/regen_re.py --fallback

# one player only
python scripts/regen_re.py --player mahoney_8bit
```

Override locations with env vars: `HVSC_MIRROR` (HVSC mirror base URL),
`SIDCACHE` (download cache dir), `DEPLAYROUTINE` (deplayroutine checkout).

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
