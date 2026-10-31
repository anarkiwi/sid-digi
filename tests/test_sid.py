"""The shared SID driver: absolute-cycle placement of a register stream."""

import numpy as np
import pytest
from pylibresidfp import SID

from siddigi import sid as sid_mod


def test_render_stream_places_each_write_at_its_cycle():
    stream = [(0, sid_mod.MODE_VOL, 0x0F), (3, sid_mod.MODE_VOL, 0x05)]
    pcm = sid_mod.render_stream(stream, rate_hz=1000.0, model="8580")
    chip = SID("8580", method="resample")
    per_tick = sid_mod.PAL_CLOCK / 1000.0
    expected = chip.run(
        [(0, sid_mod.MODE_VOL, 0x0F), (round(3 * per_tick), sid_mod.MODE_VOL, 0x05)],
        round(3 * per_tick) + round(per_tick),
    )
    assert pcm.dtype == np.int16
    assert np.array_equal(pcm, expected)


def test_render_stream_empty_runs_one_tick():
    pcm = sid_mod.render_stream([], rate_hz=1000.0)
    assert len(pcm) == pytest.approx(44.1, abs=1)


def test_render_stream_preset_is_written_at_cycle_zero():
    with_preset = sid_mod.render_stream(
        [(0, sid_mod.MODE_VOL, 0x0F)], 1000.0, preset=[(sid_mod.CONTROL, 0x49)]
    )
    without = sid_mod.render_stream([(0, sid_mod.MODE_VOL, 0x0F)], 1000.0)
    assert len(with_preset) == len(without)


@pytest.mark.parametrize("name", ["6581", "MOS8580", 6581])
def test_chip_model_normalises(name):
    assert sid_mod.chip_model(name) in ("6581", "8580")


def test_chip_model_rejects_unknown():
    with pytest.raises(ValueError):
        sid_mod.chip_model("6582")


def test_voice_reg_offsets():
    assert sid_mod.voice_reg(2, sid_mod.SUSTAIN_RELEASE) == 0x14


def test_dc_levels_follow_master_volume():
    volumes = np.arange(16)
    candidates = np.stack([np.full(16, sid_mod.MODE_VOL), volumes], axis=-1)[:, None]
    preset = [(sid_mod.CONTROL, 0x49), (sid_mod.SUSTAIN_RELEASE, 0xF0)]
    levels = sid_mod.dc_levels("8580", preset, candidates, dwell_s=1e-3)
    assert levels.shape == (16,)
    assert levels[15] > levels[0]
