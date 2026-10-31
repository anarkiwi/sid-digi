"""Thin, shared helpers for driving a pylibresidfp SID from a register stream.

Every digi technique in this repo ultimately produces a *register stream*: a
list of ``(tick, reg, val)`` events, where ``tick`` is a monotonically
increasing sample index at the technique's native sub-frame update rate.  The
:func:`render_stream` driver replays that stream into a real SID emulation
(pylibresidfp / libresidfp) and returns int16 PCM, exactly as a C64 would have
produced it -- there is no external playroutine binary in the path; the chip
is driven from first principles, every register write placed at its own
absolute CPU cycle.

This is the single point where "how the technique streams bytes to the SID"
becomes "what the SID actually sounds like".
"""

from __future__ import annotations

from typing import Iterable, Sequence, Tuple

import numpy as np
from pylibresidfp import SID

# A register-write event.  ``tick`` is an index into the technique's native
# update grid (see ``rate_hz`` returned alongside a stream); ``reg`` is a SID
# register offset (0x00..0x18); ``val`` is the 8-bit value written.
Event = Tuple[int, int, int]

PAL_CLOCK = 985248.0
NTSC_CLOCK = 1022727.0

# Register offsets within a voice; voice ``v`` (0..2) starts at ``7 * v``.
FREQ_LO, FREQ_HI, PW_LO, PW_HI, CONTROL, ATTACK_DECAY, SUSTAIN_RELEASE = range(7)
VOICE_STRIDE = 7

# Filter and master-volume registers.
FC_LO = 0x15
FC_HI = 0x16
RES_FILT = 0x17
MODE_VOL = 0x18  # filter mode + master volume


def voice_reg(voice: int, offset: int) -> int:
    """Register offset of ``offset`` (e.g. :data:`CONTROL`) in ``voice`` (0..2)."""
    return VOICE_STRIDE * voice + offset


def chip_model(name_or_model) -> str:
    """Accept ``"6581"``/``"8580"``/``"MOS6581"`` and return ``"6581"``/``"8580"``."""
    key = str(name_or_model).upper().replace("MOS", "")
    for model in ("6581", "8580"):
        if model in key:
            return model
    raise ValueError(f"unknown chip model: {name_or_model!r}")


def new_sid(
    model="8580",
    sampling_frequency: float = 44100.0,
    clock_frequency: float = PAL_CLOCK,
) -> SID:
    """Construct a reset SID emulation at the given chip model / output rate."""
    return SID(
        chip_model(model),
        clock_hz=clock_frequency,
        sampling_hz=sampling_frequency,
        method="resample",
    )


def _writes(cycles: np.ndarray, regvals: np.ndarray) -> np.ndarray:
    """``(N, 3)`` ``(cycle, reg, value)`` rows with values masked to 8 bits."""
    rows = np.empty((len(cycles), 3), dtype=np.int64)
    rows[:, 0] = cycles
    rows[:, 1:] = regvals
    rows[:, 2] &= 0xFF
    return rows


def render_stream(
    stream: Sequence[Event],
    rate_hz: float,
    model="8580",
    sampling_frequency: float = 44100.0,
    clock_frequency: float = PAL_CLOCK,
    preset: Iterable[Tuple[int, int]] = (),
) -> np.ndarray:
    """Replay a ``(tick, reg, val)`` stream through a real SID and return PCM.

    ``rate_hz`` is the technique's native update rate: tick ``t`` is written at
    CPU cycle ``round(t * clock_frequency / rate_hz)``.  ``preset`` is a list of
    ``(reg, val)`` writes applied once at cycle 0 before streaming (e.g.
    Mahoney's static waveform/AD/SR setup).  The chip runs one further tick
    after the last write so it is heard.  Returns int16 samples at
    ``sampling_frequency``.
    """
    sid = new_sid(model, sampling_frequency, clock_frequency)
    events = np.asarray(stream, dtype=np.int64).reshape(-1, 3)
    ticks = np.maximum.accumulate(events[:, 0])
    per_tick = clock_frequency / rate_hz
    cycles = np.rint(ticks * per_tick).astype(np.int64)
    pre = np.asarray(list(preset), dtype=np.int64).reshape(-1, 2)
    writes = np.concatenate(
        [
            _writes(np.zeros(len(pre), dtype=np.int64), pre),
            _writes(cycles, events[:, 1:]),
        ]
    )
    until = int(cycles[-1] if len(cycles) else 0) + int(round(per_tick))
    return sid.run(writes, until)


def dc_levels(
    model,
    preset: Iterable[Tuple[int, int]],
    candidates: np.ndarray,
    dwell_s: float,
    settle_s: float = 0.005,
    sampling_frequency: float = 44100.0,
) -> np.ndarray:
    """Mean settled output of the chip for each candidate register write set.

    ``preset`` is applied at cycle 0 and the chip settles for ``settle_s``.
    ``candidates`` is an ``(n, k, 2)`` array of ``(reg, val)`` writes; candidate
    ``i`` is written at the start of its own ``dwell_s`` window, and the level
    is the mean of the last half of that window's samples.
    """
    sid = new_sid(model, sampling_frequency)
    candidates = np.asarray(candidates, dtype=np.int64)
    count, width = candidates.shape[:2]
    settle = int(round(settle_s * sid.clock_hz))
    dwell = int(round(dwell_s * sid.clock_hz))
    pre = np.asarray(list(preset), dtype=np.int64).reshape(-1, 2)
    starts = settle + dwell * np.arange(count)
    writes = np.concatenate(
        [
            _writes(np.zeros(len(pre), dtype=np.int64), pre),
            _writes(np.repeat(starts, width), candidates.reshape(-1, 2)),
        ]
    )
    samples = sid.run(writes, settle + dwell * count)
    bounds = np.append(starts, settle + dwell * count)
    edges = np.floor(bounds * sid.sampling_hz / sid.clock_hz).astype(np.int64)
    lo, hi = edges[:-1], edges[1:]
    tail = lo + (hi - lo) // 2
    csum = np.concatenate([[0.0], np.cumsum(samples, dtype=np.float64)])
    return (csum[hi] - csum[tail]) / np.maximum(hi - tail, 1)
