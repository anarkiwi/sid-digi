"""Technique: test-bit / pulse-width DC "pseudo-sample".

Mechanism
---------
Setting a voice's TEST bit (bit 3 of the control register) resets and freezes
its oscillator.  While frozen, a **pulse** waveform outputs a constant DC level
whose value is determined entirely by the 12-bit pulse-width register: the
oscillator phase accumulator is held at zero, so the pulse comparator output is
a steady "phase < pulse-width?" => a fixed high/low rail, and intermediate
pulse-width values combined with the DAC produce a controllable DC offset.

By keeping the TEST bit set and writing a new pulse-width value every sub-frame
tick, a single voice becomes a DC-steppable amplitude source -- a "pseudo
sample" -- without ever oscillating.  Unlike the ``$D418`` digi this stays on
one voice, leaving master volume free, and the pulse-width gives more than 4
bits of control.

Registers used
    One voice: control reg = ``$x4`` value with TEST(+pulse) bit set, and the
    two pulse-width registers ``$D402/$D403`` (voice 1) written per sample.

Sub-frame timing
    Same NMI/CIA cadence as other digis; each tick rewrites the pulse width.

Bit depth
    The pulse-width register is 12-bit but the usable DC swing is narrower; in
    practice ~6-8 effective bits depending on chip.

6581 vs 8580
    The DC level vs pulse-width curve differs between chips (and the 6581's
    leakage makes the frozen level drift), so we calibrate the mapping per
    model, like the Mahoney table.

Players
    Used for soft "pseudo-digi" basslines and the DC-offset trick in several
    demo players; the test-bit DC primitive also underlies parts of Mahoney's
    setup.
"""

from __future__ import annotations

import datetime
from functools import lru_cache
from typing import List, Tuple

import numpy as np

from pyresidfp import WritableRegister as W
from .sid import Event, new_sid
from .wav import load_wav_mono, resample_to, save_wav

NATIVE_RATE_HZ = 11025.0

PW_LO = int(W.Voice1_Pw_Lo)
PW_HI = int(W.Voice1_Pw_Hi)
CTRL = int(W.Voice1_Control_Reg)

# Voice 1: pulse waveform (bit6) + TEST (bit3) + GATE (bit0) so the envelope
# opens to sustain and holds the frozen DC.
CTRL_VAL = 0x49 | 0x01  # pulse + test + gate
PRESET: Tuple[Tuple[int, int], ...] = (
    (int(W.Voice1_Attack_Decay), 0x00),
    (int(W.Voice1_Sustain_Release), 0xF0),  # sustain=15
    (int(W.Filter_Mode_Vol), 0x0F),  # full master volume, no filter
    (CTRL, CTRL_VAL),
)

_PW_STEPS = 256  # candidate pulse-width values (high nibble sweep)


@lru_cache(maxsize=4)
def calibrate(chip_model: str = "8580") -> Tuple[np.ndarray, np.ndarray]:
    """Measure DC output vs 12-bit pulse width (sampled across its range)."""
    sid = new_sid(chip_model, sampling_frequency=44100.0)
    for reg, val in PRESET:
        sid.write_register(W(reg), val)
    sid.clock(datetime.timedelta(milliseconds=5))

    pws = np.linspace(0, 0x0FFF, _PW_STEPS).astype(np.int32)
    levels = np.empty(_PW_STEPS, dtype=np.float64)
    for i, pw in enumerate(pws):
        sid.write_register(W.Voice1_Pw_Lo, int(pw) & 0xFF)
        sid.write_register(W.Voice1_Pw_Hi, (int(pw) >> 8) & 0x0F)
        samp = np.asarray(sid.clock(datetime.timedelta(milliseconds=0.5)), dtype=np.float64)
        levels[i] = samp[len(samp) // 2 :].mean()
    order = np.argsort(levels, kind="stable")
    return pws[order].copy(), levels[order].copy()


def _table(chip_model: str) -> np.ndarray:
    pws, levels = calibrate(chip_model)
    lo, hi = levels[0], levels[-1]
    if hi <= lo:
        return np.linspace(0, 0x0FFF, 256).astype(np.int32)
    targets = np.linspace(lo, hi, 256)
    idx = np.clip(np.searchsorted(levels, targets), 0, len(levels) - 1)
    return pws[idx].astype(np.int32)


def encode(wav_path: str, chip_model: str = "8580", rate_hz: float = NATIVE_RATE_HZ) -> List[Event]:
    """Stream a WAV as per-sample pulse-width writes on a TEST-frozen voice."""
    mono, sr = load_wav_mono(wav_path)
    res = resample_to(mono, sr, rate_hz)
    codes = np.clip(np.round((res * 0.5 + 0.5) * 255.0), 0, 255).astype(np.int32)
    table = _table(chip_model)
    pw = table[codes]
    stream: List[Event] = []
    for i, p in enumerate(pw):
        stream.append((i, PW_LO, int(p) & 0xFF))
        stream.append((i, PW_HI, (int(p) >> 8) & 0x0F))
    return stream


def render(stream, chip_model: str = "8580", rate_hz: float = NATIVE_RATE_HZ) -> np.ndarray:
    from .sid import render_stream

    return render_stream(stream, rate_hz=rate_hz, model=chip_model, preset=PRESET)


def main(argv=None) -> int:
    import argparse

    ap = argparse.ArgumentParser(description="Test-bit/pulse-width DC SID digi player")
    ap.add_argument("wav_in")
    ap.add_argument("wav_out")
    ap.add_argument("--chip", default="8580", choices=["6581", "8580"])
    ap.add_argument("--rate", type=float, default=NATIVE_RATE_HZ)
    args = ap.parse_args(argv)
    stream = encode(args.wav_in, chip_model=args.chip, rate_hz=args.rate)
    pcm = render(stream, chip_model=args.chip, rate_hz=args.rate)
    save_wav(args.wav_out, pcm, 44100)
    print(f"wrote {args.wav_out}: {len(pcm)} samples (pulse-DC, {args.chip} @ {args.rate:.0f} Hz)")
    return 0


if __name__ == "__main__":  # pragma: no cover
    raise SystemExit(main())
