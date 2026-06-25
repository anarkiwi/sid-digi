"""Per-technique encode + render tests.

Digi is lossy; we assert *native-fidelity* reproduction (pitch tracked, output
non-silent, right shape), NOT byte-exact equality.
"""

from __future__ import annotations

import numpy as np
import pytest

from siddigi import TECHNIQUES, d418_4bit, frodigi, galway, mahoney_8bit, pulse_dc
from tests.conftest import dominant_freq

# ---- generic shape / non-silence across every registered technique ----------


@pytest.mark.parametrize("name", list(TECHNIQUES))
def test_encode_render_shape(name, tone_wav):
    path, _freq, _sr = tone_wav
    module, _mech, chip = TECHNIQUES[name]
    stream = module.encode(path)
    assert len(stream) > 0
    for tick, reg, val in stream[:10]:
        assert tick >= 0
        assert 0 <= reg <= 0x18
        assert 0 <= val <= 0xFF
    pcm = module.render(stream, chip)
    assert pcm.dtype == np.int16
    assert len(pcm) > 1000
    assert np.abs(pcm.astype(np.int32)).max() > 200  # non-silent


# ---- $D418 4-bit: reproduces the tone's pitch (6581 DAC) --------------------


def test_d418_4bit_pitch(make_tone_wav):
    path = make_tone_wav(400.0)
    stream = d418_4bit.encode(path)
    pcm = d418_4bit.render(stream, "6581")
    peak = dominant_freq(pcm)
    assert abs(peak - 400.0) < 25.0  # within a few percent


def test_d418_4bit_is_volume_register_only(make_tone_wav):
    stream = d418_4bit.encode(make_tone_wav(300.0))
    regs = {reg for _t, reg, _v in stream}
    assert regs == {0x18}  # only $D418 master volume touched
    # 4-bit: only the low nibble carries data
    assert all((v & 0xF0) == 0 for _t, _r, v in stream)


# ---- Mahoney 8-bit: more distinct levels than 4-bit, tone reproduced --------


@pytest.mark.parametrize("chip", ["8580", "6581"])
def test_mahoney_calibration_resolution(chip):
    _writes, levels = mahoney_8bit.calibrate(chip)
    # the whole point: the 256 $D418 bytes give many more than 16 levels
    distinct = len(np.unique(np.round(levels)))
    assert distinct > 64  # far beyond 4-bit's 16


@pytest.mark.parametrize("chip", ["8580", "6581"])
def test_mahoney_pitch(make_tone_wav, chip):
    path = make_tone_wav(400.0)
    stream = mahoney_8bit.encode(path, chip)
    pcm = mahoney_8bit.render(stream, chip)
    assert abs(dominant_freq(pcm) - 400.0) < 30.0


# ---- pulse-DC: calibrated distinct DC levels exist (the mechanism) ----------
# (Honest limitation: at high update rates the AC tone does not survive the
#  emulator's output coupling; see README.  We assert the DC-level mechanism
#  itself works -- the pulse-width sweep yields many distinct output levels.)


@pytest.mark.parametrize("chip", ["8580", "6581"])
def test_pulse_dc_levels(chip):
    _pws, levels = pulse_dc.calibrate(chip)
    assert levels[-1] - levels[0] > 100.0  # a usable DC swing
    assert len(np.unique(np.round(levels))) > 16


def test_pulse_dc_non_silent(make_tone_wav):
    stream = pulse_dc.encode(make_tone_wav(200.0), "6581")
    pcm = pulse_dc.render(stream, "6581")
    assert np.abs(pcm.astype(np.int32)).max() > 200


def test_pulse_dc_touches_pulse_width(make_tone_wav):
    stream = pulse_dc.encode(make_tone_wav(200.0), "8580")
    regs = {reg for _t, reg, _v in stream}
    assert {0x02, 0x03} <= regs  # voice-1 pulse-width lo/hi


# ---- Galway: packed-nibble 4-bit $D418, CPU-paced, pitch reproduced ---------


def test_galway_pitch(make_tone_wav):
    path = make_tone_wav(350.0)
    stream = galway.encode(path)
    pcm = galway.render(stream, "6581")
    assert abs(dominant_freq(pcm) - 350.0) < 30.0


def test_galway_nibble_packing_roundtrips():
    codes = np.array([0, 15, 3, 8, 1, 14], dtype=np.int32)
    packed = galway.pack_nibbles(codes)
    assert galway.unpack_nibbles(packed) == codes.tolist()


def test_galway_cpu_cadence():
    # ticks must advance by the alternating 125/130 cycle spacing
    stream = galway.encode  # noqa: F841 (importable)
    import soundfile as sf
    import numpy as np
    import tempfile
    import os

    sr = 22050
    t = np.arange(int(sr * 0.05)) / sr
    fd, p = tempfile.mkstemp(suffix=".wav")
    os.close(fd)
    sf.write(p, (0.5 * np.sin(2 * np.pi * 300 * t)).astype("float32"), sr)
    s = galway.encode(p)
    os.unlink(p)
    deltas = {s[i + 1][0] - s[i][0] for i in range(len(s) - 1)}
    assert deltas <= {galway.CYCLES_A, galway.CYCLES_B}


# ---- Frodigi: oscillator resynthesis tracks the fundamental pitch -----------


@pytest.mark.parametrize("freq", [220.0, 330.0, 440.0])
def test_frodigi_tracks_pitch(make_tone_wav, freq):
    path = make_tone_wav(freq, secs=0.6)
    stream = frodigi.encode(path, "8580")
    pcm = frodigi.render(stream, "8580")
    peak = dominant_freq(pcm)
    # resynthesis: fundamental within ~8% (sawtooth + 50 Hz frame grid)
    assert abs(peak - freq) / freq < 0.08


def test_frodigi_uses_oscillators_not_d418_pcm(make_tone_wav):
    stream = frodigi.encode(make_tone_wav(440.0), "8580")
    regs = {reg for _t, reg, _v in stream}
    # frequency + control regs present -> oscillator path, not pure $D418 PCM
    assert 0x00 in regs or 0x01 in regs  # voice1 freq lo/hi
    assert 0x04 in regs  # voice1 control (waveform/gate)
