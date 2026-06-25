"""Technique: Galway-style sample player (CPU-paced 4-bit ``$D418`` PCM).

Mechanism
---------
Martin Galway's sample player (Arkanoid drums, Combat School, Game Over) is, at
its core, the **same 4-bit ``$D418`` master-volume PCM** mechanism as the
classic digi -- it "wiggles the volume register".  What makes it a distinct
*packaging* worth documenting:

* **Nibble packing.** Sample bytes hold *two* 4-bit samples; the player emits
  the high nibble (``LSR`` x4) then the low nibble (``AND #$0F``), so one byte
  becomes two ``$D418`` writes.
* **CPU-paced timing, not interrupt-driven.** Unlike Hubbard's CIA/NMI digi,
  Galway's routine is a blocking cycle-counted delay loop; samples alternate
  ~125 / ~130 CPU cycles apart, giving ~8 kHz with slight jitter (and freezing
  everything else while a sample plays).

So mechanistically: ``$D418`` 4-bit, but addressed as a packed nibble stream at
a CPU-delay cadence rather than a clean timer tick.

Registers used
    ``$D418`` low nibble (one write per nibble = per sample).

Sub-frame timing
    ~8 kHz, alternating 125/130 cycle spacing (we model the alternation so the
    cadence matches Galway's busy-wait loop rather than a perfect clock).

Bit depth
    4 bits, two samples packed per byte.

6581 vs 8580
    Galway wrote for the 6581, whose master-volume DAC offset makes ``$D418``
    writes audible without a sounding voice.  Default 6581 here.

ref: XeNTaX "SID DIGI Play Routines" (Combat School driver, 125/130-cycle loop)
    <https://c64.xentax.com/index.php/16-sid-digi-play-routines>. See README.
"""

from __future__ import annotations

from typing import List

import numpy as np

from .sid import Event, MODE_VOL, PAL_CLOCK, render_stream
from .wav import load_wav_mono, quantize_unsigned, resample_to, save_wav

# Galway's two alternating per-sample cycle counts (busy-wait loop).
CYCLES_A = 125
CYCLES_B = 130
# Effective average sample rate (PAL clock / mean spacing).
NATIVE_RATE_HZ = PAL_CLOCK / ((CYCLES_A + CYCLES_B) / 2.0)  # ~7727 Hz


def pack_nibbles(codes: np.ndarray) -> List[int]:
    """Pack a 4-bit code stream into bytes (hi nibble first), as Galway stores."""
    if len(codes) % 2:
        codes = np.append(codes, 0)
    hi = codes[0::2] & 0x0F
    lo = codes[1::2] & 0x0F
    return [int((h << 4) | l) for h, l in zip(hi, lo)]


def unpack_nibbles(packed: List[int]) -> List[int]:
    """Recover the 4-bit sample stream (hi nibble then lo) from packed bytes."""
    out: List[int] = []
    for b in packed:
        out.append((b >> 4) & 0x0F)
        out.append(b & 0x0F)
    return out


def encode(wav_path: str) -> List[Event]:
    """Stream a WAV as packed 4-bit ``$D418`` writes at Galway's CPU cadence.

    Ticks are expressed in CPU cycles (PAL), alternating 125/130 like the
    busy-wait loop, so :func:`render` clocks the SID by real cycle gaps.
    """
    mono, sr = load_wav_mono(wav_path)
    res = resample_to(mono, sr, NATIVE_RATE_HZ)
    codes = quantize_unsigned(res, 4)
    packed = pack_nibbles(codes)
    samples = unpack_nibbles(packed)  # round-trip through the packed form

    stream: List[Event] = []
    cyc = 0
    for i, s in enumerate(samples):
        stream.append((cyc, MODE_VOL, int(s) & 0x0F))
        cyc += CYCLES_A if (i % 2 == 0) else CYCLES_B
    return stream


def render(stream, chip_model: str = "6581") -> np.ndarray:
    """Drive a real SID; ticks are CPU cycles, so rate == clock frequency."""
    return render_stream(stream, rate_hz=PAL_CLOCK, model=chip_model, clock_frequency=PAL_CLOCK)


def main(argv=None) -> int:
    import argparse

    ap = argparse.ArgumentParser(description="Galway-style 4-bit $D418 SID digi player")
    ap.add_argument("wav_in")
    ap.add_argument("wav_out")
    ap.add_argument("--chip", default="6581", choices=["6581", "8580"])
    args = ap.parse_args(argv)
    stream = encode(args.wav_in)
    pcm = render(stream, chip_model=args.chip)
    save_wav(args.wav_out, pcm, 44100)
    print(f"wrote {args.wav_out}: {len(pcm)} samples (Galway 4-bit packed, {args.chip})")
    return 0


if __name__ == "__main__":  # pragma: no cover
    raise SystemExit(main())
