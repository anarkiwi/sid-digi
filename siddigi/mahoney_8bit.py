"""Technique: Mahoney 8-bit (the "Musik Run/Stop" / 8bitDigi technique, 8580).

Mechanism
---------
Pex 'Mahoney' Tufvesson's technique lifts the SID from a 4-bit ``$D418`` DAC to
an effectively ~8-bit DAC by *adding extra, finer amplitude levels underneath
the 4 volume bits*.  It does this with a static setup and a single per-sample
write:

Static setup (verbatim from Mahoney's white paper, "Technical details of Musik
Run/Stop", Lund 2014):

==========  =====  ============================================================
Register    Value  Meaning
==========  =====  ============================================================
$D404/B/12  $49    pulse waveform + TEST bit on all 3 voices -> frozen DC
$D405/C/13  $0F    attack=0, decay=15
$D406/D/14  $FF    sustain=15, release=15  (each voice holds a DC offset)
$D415/D416  $FF    filter cutoff maxed
$D417       $03    route voices 1+2 through the filter (resonance 0)
$D418       table  per-sample: ONE write, value from a 256-entry lookup table
==========  =====  ============================================================

The three TEST-bit-frozen voices sit at fixed DC offsets.  The upper nibble of
``$D418`` (the filter mode/routing bits) decides whether those DC offsets reach
the output through the filter (gain ~ -1, and crucially *not exactly* -1).  So
the byte written to ``$D418`` jointly chooses the 4-bit master volume (low
nibble) AND a filter-routing state (high nibble); the 256 possible bytes map to
many more than 16 distinct analog output levels.

The levels are NOT linear, so Mahoney *measured* the output of every one of the
256 possible ``$D418`` writes on real hardware and built a "translation table":
``write = table[desired_amplitude]``.  We reproduce that calibration *from first
principles* here by measuring the emulated SID instead of real silicon (see
:func:`calibrate`), then invert it into a playback table.

Sub-frame timing
    Mahoney clocks ``sta $d418`` at a constant ~21 cycles -> ~47 kHz on PAL, the
    famous "44.1 kHz on a 1982 computer".  We use a representative high rate.

Bit depth
    8-bit sample input; mapped through the measured 256-entry table.  Real
    distinct-level counts are model dependent (the 6581's analog offsets give
    more usable levels than the cleaner 8580); "8-bit" is the practical claim,
    not a guaranteed 256 monotonic levels.

6581 vs 8580
    Both work but with different tables because the analog level set differs.
    We calibrate per chosen model so the table matches the chip being driven.
"""

from __future__ import annotations

import datetime
from functools import lru_cache
from typing import List, Tuple

import numpy as np

from pyresidfp import WritableRegister as W
from .sid import Event, MODE_VOL, new_sid
from .wav import load_wav_mono, resample_to, save_wav

NATIVE_RATE_HZ = 32000.0  # representative high sub-frame cadence

# Static setup, exactly per Mahoney's white paper (reg address, value).
PRESET: Tuple[Tuple[int, int], ...] = (
    (int(W.Voice1_Control_Reg), 0x49),
    (int(W.Voice2_Control_Reg), 0x49),
    (int(W.Voice3_Control_Reg), 0x49),
    (int(W.Voice1_Attack_Decay), 0x0F),
    (int(W.Voice2_Attack_Decay), 0x0F),
    (int(W.Voice3_Attack_Decay), 0x0F),
    (int(W.Voice1_Sustain_Release), 0xFF),
    (int(W.Voice2_Sustain_Release), 0xFF),
    (int(W.Voice3_Sustain_Release), 0xFF),
    (int(W.Filter_Fc_Lo), 0xFF),
    (int(W.Filter_Fc_Hi), 0xFF),
    (int(W.Filter_Res_Filt), 0x03),
)


@lru_cache(maxsize=4)
def calibrate(chip_model: str = "8580") -> Tuple[np.ndarray, np.ndarray]:
    """Measure the emulated SID's DC output level for all 256 ``$D418`` bytes.

    This is the software analogue of Mahoney measuring real silicon: apply the
    static setup, write each candidate byte to ``$D418``, let it settle, and
    record the mean output level.  Returns ``(writes, levels)`` where
    ``writes[k]`` is a ``$D418`` byte and ``levels[k]`` its measured output,
    sorted by increasing level (monotone) for use as a translation table.
    """
    sid = new_sid(chip_model, sampling_frequency=44100.0)
    for reg, val in PRESET:
        sid.write_register(W(reg), val)
    # let the gated DC settle
    sid.clock(datetime.timedelta(milliseconds=5))

    bytes_ = np.arange(256, dtype=np.int32)
    levels = np.empty(256, dtype=np.float64)
    for b in bytes_:
        sid.write_register(W.Filter_Mode_Vol, int(b))
        samp = sid.clock(datetime.timedelta(milliseconds=1.0))
        # use the tail to skip the transient toward the new DC level
        arr = np.asarray(samp, dtype=np.float64)
        levels[b] = arr[len(arr) // 2 :].mean()

    order = np.argsort(levels, kind="stable")
    return bytes_[order].copy(), levels[order].copy()


def _build_playback_table(chip_model: str) -> np.ndarray:
    """Map 256 desired amplitudes (0..255) -> the ``$D418`` byte to write."""
    writes, levels = calibrate(chip_model)
    lo, hi = levels[0], levels[-1]
    if hi <= lo:  # degenerate; fall back to identity volume nibble
        return np.arange(256, dtype=np.int32) & 0x0F
    targets = np.linspace(lo, hi, 256)
    # for each target amplitude pick the calibrated byte with nearest level
    idx = np.searchsorted(levels, targets)
    idx = np.clip(idx, 0, len(levels) - 1)
    return writes[idx].astype(np.int32)


def encode(wav_path: str, chip_model: str = "8580", rate_hz: float = NATIVE_RATE_HZ) -> List[Event]:
    """Stream a WAV as 8-bit codes mapped through the measured ``$D418`` table."""
    mono, sr = load_wav_mono(wav_path)
    res = resample_to(mono, sr, rate_hz)
    codes8 = np.clip(np.round((res * 0.5 + 0.5) * 255.0), 0, 255).astype(np.int32)
    table = _build_playback_table(chip_model)
    writes = table[codes8]
    return [(i, MODE_VOL, int(w)) for i, w in enumerate(writes)]


def render(stream, chip_model: str = "8580", rate_hz: float = NATIVE_RATE_HZ) -> np.ndarray:
    """Drive a real SID with the Mahoney static setup + ``$D418`` stream."""
    from .sid import render_stream

    return render_stream(stream, rate_hz=rate_hz, model=chip_model, preset=PRESET)


def main(argv=None) -> int:
    import argparse

    ap = argparse.ArgumentParser(description="Mahoney 8-bit SID digi player")
    ap.add_argument("wav_in")
    ap.add_argument("wav_out")
    ap.add_argument("--chip", default="8580", choices=["6581", "8580"])
    ap.add_argument("--rate", type=float, default=NATIVE_RATE_HZ)
    args = ap.parse_args(argv)

    stream = encode(args.wav_in, chip_model=args.chip, rate_hz=args.rate)
    pcm = render(stream, chip_model=args.chip, rate_hz=args.rate)
    save_wav(args.wav_out, pcm, 44100)
    print(
        f"wrote {args.wav_out}: {len(pcm)} samples (Mahoney 8-bit, {args.chip} @ {args.rate:.0f} Hz)"
    )
    return 0


if __name__ == "__main__":  # pragma: no cover
    raise SystemExit(main())
