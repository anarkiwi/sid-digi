"""Shared test fixtures: tiny generated tones/sweeps written to temp WAVs."""

from __future__ import annotations

import numpy as np
import pytest
import soundfile as sf


def _tone(freq: float, secs: float, sr: int, amp: float = 0.7) -> np.ndarray:
    t = np.arange(int(sr * secs)) / sr
    return (amp * np.sin(2 * np.pi * freq * t)).astype(np.float32)


@pytest.fixture
def tone_wav(tmp_path):
    """A 0.4 s, 400 Hz mono tone at 22050 Hz; returns (path, freq, sr)."""
    sr, freq = 22050, 400.0
    path = tmp_path / "tone.wav"
    sf.write(path, _tone(freq, 0.4, sr), sr)
    return str(path), freq, sr


@pytest.fixture
def make_tone_wav(tmp_path):
    """Factory: make_tone_wav(freq, secs=0.4, sr=22050) -> path."""

    def _make(freq, secs=0.4, sr=22050, amp=0.7):
        path = tmp_path / f"tone_{int(freq)}.wav"
        sf.write(path, _tone(freq, secs, sr, amp), sr)
        return str(path)

    return _make


def dominant_freq(pcm: np.ndarray, sr: int = 44100, ignore_below: float = 50.0) -> float:
    """Spectral peak of PCM above ``ignore_below`` Hz (skips DC/coupling bin)."""
    x = pcm.astype(np.float64)
    x = x - x.mean()
    mag = np.abs(np.fft.rfft(x))
    freqs = np.fft.rfftfreq(len(x), 1.0 / sr)
    mag[freqs < ignore_below] = 0.0
    return float(freqs[int(np.argmax(mag))])
