"""WAV load/save + resampling helpers shared by every technique.

Digi players stream PCM at a fixed sub-frame rate (e.g. 8 kHz NMI ticks), so a
technique must resample the input WAV to its native rate before encoding, and
the rendered output comes back at the SID emulation's output rate (44.1 kHz).
"""

from __future__ import annotations

from typing import Tuple

import numpy as np
import soundfile as sf
from scipy.signal import resample_poly


def load_wav_mono(path: str) -> Tuple[np.ndarray, int]:
    """Load a WAV as float32 mono in [-1, 1] with its sample rate."""
    data, sr = sf.read(path, dtype="float32", always_2d=True)
    mono = data.mean(axis=1)
    return mono.astype(np.float32), int(sr)


def save_wav(path: str, samples: np.ndarray, sr: int) -> None:
    """Write int16 or float samples to a WAV file."""
    sf.write(path, samples, int(sr))


def resample_to(samples: np.ndarray, src_sr: int, dst_sr: float) -> np.ndarray:
    """High-quality polyphase resample, returning float32 in [-1, 1]."""
    if int(src_sr) == int(dst_sr):
        return samples.astype(np.float32)
    # resample_poly wants integer up/down; approximate the ratio closely.
    from math import gcd

    up = int(round(dst_sr))
    down = int(src_sr)
    g = gcd(up, down)
    up //= g
    down //= g
    out = resample_poly(samples, up, down)
    return out.astype(np.float32)


def quantize_unsigned(samples: np.ndarray, bits: int) -> np.ndarray:
    """Map float [-1, 1] to unsigned integer codes in [0, 2**bits - 1]."""
    levels = (1 << bits) - 1
    x = np.clip((samples + 1.0) * 0.5, 0.0, 1.0)
    return np.round(x * levels).astype(np.int32)
