"""Thin, shared helpers for driving a pyresidfp SID from a register stream.

Every digi technique in this repo ultimately produces a *register stream*: a
list of ``(tick, reg, val)`` events, where ``tick`` is a monotonically
increasing sample index at the technique's native sub-frame update rate.  The
:func:`render_stream` driver replays that stream into a real SID emulation
(pyresidfp / reSIDfp) and returns int16 PCM, exactly as a C64 would have
produced it -- there is no external playroutine binary in the path; the chip
is driven from first principles, one register write at a time, with the chip
clocked for the inter-event interval in between.

This is the single point where "how the technique streams bytes to the SID"
becomes "what the SID actually sounds like".
"""

from __future__ import annotations

import datetime
from typing import Iterable, List, Sequence, Tuple

import numpy as np

from pyresidfp import SoundInterfaceDevice, WritableRegister
from pyresidfp.sound_interface_device import ChipModel, SamplingMethod

# A register-write event.  ``tick`` is an index into the technique's native
# update grid (see ``rate_hz`` returned alongside a stream); ``reg`` is a SID
# register address (0x00..0x18); ``val`` is the 8-bit value written.
Event = Tuple[int, int, int]

PAL_CLOCK = SoundInterfaceDevice.PAL_CLOCK_FREQUENCY  # ~985248 Hz
NTSC_CLOCK = SoundInterfaceDevice.NTSC_CLOCK_FREQUENCY

# SID register addresses we use, by name, so technique code stays readable.
REG = {
    name: int(getattr(WritableRegister, name))
    for name in dir(WritableRegister)
    if not name.startswith("_") and name[0].isupper()
}

# Convenience aliases for the registers digis touch most.
MODE_VOL = int(WritableRegister.Filter_Mode_Vol)  # 0x18: filter mode + master volume
RES_FILT = int(WritableRegister.Filter_Res_Filt)  # 0x17
FC_LO = int(WritableRegister.Filter_Fc_Lo)  # 0x15
FC_HI = int(WritableRegister.Filter_Fc_Hi)  # 0x16


def _writable(reg: int) -> WritableRegister:
    """Map a raw SID register address to the pyresidfp enum member."""
    return WritableRegister(reg)


def chip_model(name_or_model) -> ChipModel:
    """Accept ``"6581"``/``"8580"``/``ChipModel`` and return a ``ChipModel``."""
    if isinstance(name_or_model, ChipModel):
        return name_or_model
    key = str(name_or_model).upper().replace("MOS", "")
    if "6581" in key:
        return ChipModel.MOS6581
    if "8580" in key:
        return ChipModel.MOS8580
    raise ValueError(f"unknown chip model: {name_or_model!r}")


def new_sid(
    model="8580",
    sampling_frequency: float = 44100.0,
    clock_frequency: float = PAL_CLOCK,
) -> SoundInterfaceDevice:
    """Construct a reset SID emulation at the given chip model / output rate."""
    sid = SoundInterfaceDevice(
        model=chip_model(model),
        sampling_method=SamplingMethod.RESAMPLE,
        clock_frequency=clock_frequency,
        sampling_frequency=sampling_frequency,
    )
    sid.reset()
    return sid


def render_stream(
    stream: Sequence[Event],
    rate_hz: float,
    model="8580",
    sampling_frequency: float = 44100.0,
    clock_frequency: float = PAL_CLOCK,
    preset: Iterable[Tuple[int, int]] = (),
) -> np.ndarray:
    """Replay a ``(tick, reg, val)`` stream through a real SID and return PCM.

    ``rate_hz`` is the technique's native update rate -- the chip is clocked for
    ``1 / rate_hz`` seconds between consecutive ticks.  ``preset`` is a list of
    ``(reg, val)`` writes applied once before streaming (e.g. Mahoney's static
    waveform/AD/SR setup).  Returns int16 samples at ``sampling_frequency``.
    """
    sid = new_sid(model, sampling_frequency, clock_frequency)
    for reg, val in preset:
        sid.write_register(_writable(reg), int(val) & 0xFF)

    out: List[int] = []
    dt = datetime.timedelta(seconds=1.0 / rate_hz)
    last_tick = 0
    for tick, reg, val in stream:
        # Advance the chip for the gap since the previous event, capturing audio.
        gap = tick - last_tick
        if gap > 0:
            out.extend(sid.clock(datetime.timedelta(seconds=gap / rate_hz)))
            last_tick = tick
        sid.write_register(_writable(reg), int(val) & 0xFF)
    # Flush one final tick so the last write is heard.
    out.extend(sid.clock(dt))
    return np.asarray(out, dtype=np.int16)
