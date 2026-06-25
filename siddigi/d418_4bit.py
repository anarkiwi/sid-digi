"""Technique: 4-bit ``$D418`` volume-register PCM (the classic SID digi).

Mechanism
---------
The SID master-volume nibble lives in the low 4 bits of register ``$D418``
(``Filter_Mode_Vol``).  On the 6581/8580, the *path from the master-volume DAC
to the audio output is itself a (deliberately tiny) signal*: changing the
volume produces a step on the output pin even when no voice is audibly playing.
A digi player therefore ignores the oscillators entirely and just writes a
stream of 4-bit PCM sample codes into ``$D418`` at a fixed sub-frame rate,
turning the 4-bit master-volume control into a 4-bit DAC.

Registers used
    ``$D418`` low nibble only (one write per output sample).

Sub-frame timing
    The samples are clocked by a CIA/raster/NMI timer, NOT once per video
    frame.  Typical rates are 4-11 kHz (e.g. Hubbard game drums ~5-8 kHz).
    A once-per-frame siddump oracle samples only one value per ~20 ms and so
    sees a flat line -- this is why frame-based dumpers "miss" digis.

Bit depth
    4 bits (16 levels), unsigned.

6581 vs 8580
    On the **6581** the master-volume DAC is non-linear and there is a strong
    "DAC click" component: the technique works specifically because each
    write thumps the output rail.  Classic 6581 game digis (Hubbard, Galway
    drums) rely on this.  On the **8580** the DAC is cleaner and more linear,
    so the same writes give a more faithful (if quieter) 4-bit DAC.  reSIDfp
    models both; we default to 6581 here because that is the historically
    dominant chip for this technique.

Players using this mechanism
    Rob Hubbard's game digi drums, Martin Galway drum samples, Kim Christensen
    (FutureComposer digi), the bulk of ``*Digi*`` 4-bit streamers, Voicetracker.
"""

from __future__ import annotations

from typing import List

import numpy as np

from .sid import Event, MODE_VOL, render_stream
from .wav import load_wav_mono, quantize_unsigned, resample_to, save_wav

NATIVE_RATE_HZ = 8000.0  # representative NMI/CIA streaming cadence


def encode(wav_path: str, rate_hz: float = NATIVE_RATE_HZ) -> List[Event]:
    """Stream a WAV as 4-bit codes written to ``$D418`` at ``rate_hz``.

    Returns ``(tick, reg, val)`` events: one ``$D418`` write per output sample,
    ``val`` carrying a 4-bit PCM code in its low nibble.
    """
    mono, sr = load_wav_mono(wav_path)
    res = resample_to(mono, sr, rate_hz)
    codes = quantize_unsigned(res, 4)  # 0..15
    return [(i, MODE_VOL, int(c) & 0x0F) for i, c in enumerate(codes)]


def render(stream, chip_model="6581", rate_hz: float = NATIVE_RATE_HZ) -> np.ndarray:
    """Drive a real SID with the ``$D418`` stream; return int16 PCM."""
    return render_stream(stream, rate_hz=rate_hz, model=chip_model)


def main(argv=None) -> int:
    import argparse

    ap = argparse.ArgumentParser(description="4-bit $D418 SID digi player")
    ap.add_argument("wav_in")
    ap.add_argument("wav_out")
    ap.add_argument("--chip", default="6581", choices=["6581", "8580"])
    ap.add_argument("--rate", type=float, default=NATIVE_RATE_HZ)
    args = ap.parse_args(argv)

    stream = encode(args.wav_in, rate_hz=args.rate)
    pcm = render(stream, chip_model=args.chip, rate_hz=args.rate)
    save_wav(args.wav_out, pcm, 44100)
    print(f"wrote {args.wav_out}: {len(pcm)} samples ({args.chip}, 4-bit @ {args.rate:.0f} Hz)")
    return 0


if __name__ == "__main__":  # pragma: no cover
    raise SystemExit(main())
