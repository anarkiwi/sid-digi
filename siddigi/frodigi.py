"""Technique: Frodigi-style oscillator resynthesis (classic Frodigi 1-5).

Mechanism
---------
The classic Frodigi (by Algorithm / Naveed Khugiani) is **not** a ``$D418`` PCM
streamer at all -- it is **additive oscillator resynthesis**.  Once per video
frame (50 Hz) it reads a small per-channel parameter word (the original picks
one of ~512 predefined notes per channel plus a 4-bit master volume) and drives
the SID's *free-running oscillators* so that their summed output approximates
the source audio.  A PC-side encoder searches (hill-climbing) for the per-frame
oscillator settings that best match the wave.

This is a genuinely distinct technique from the volume-DAC digis: the audio
comes out of the normal SID synthesis path (frequency + waveform registers),
not a sample DAC.  Its hallmark is extreme compression (a few hundred
bytes/sec) at the cost of a "coloured by the oscillator" timbre -- it is
clearly lossy and tonal, not transparent PCM.

We reproduce the *spirit* from first principles: per 50 Hz frame, pick, per
voice, the SID frequency whose sawtooth best matches the dominant spectral
content of that frame, and a master volume from the frame's RMS, then let real
SID oscillators render it.  (We do not ship the original 512-note codebook; we
derive frequencies directly, which is the same mechanism at a finer grid.)

Registers used
    Per voice: ``Freq_Lo``/``Freq_Hi`` + ``Control`` (sawtooth, gated);
    ``$D418`` master volume per frame.

Sub-frame timing
    Per *frame* (50 Hz) -- unlike the kHz-rate DACs, Frodigi updates at the
    normal play-call rate; the resynthesis, not a high sample rate, carries the
    audio.

Bit depth
    Not a PCM bit depth -- frequency words + 4-bit volume.

6581 vs 8580
    The oscillators behave similarly on both; we default to 8580 (Frodigi HVSC
    tunes are 8580 RSID) but either renders.

Honesty
    This is the *most* lossy technique here: a single sawtooth per voice cannot
    reproduce arbitrary PCM.  The test asserts it tracks the dominant pitch and
    loudness envelope of a tonal input, not waveform fidelity.
"""

from __future__ import annotations

from typing import List, Tuple

import numpy as np

from pyresidfp import WritableRegister as W
from .sid import Event, MODE_VOL, PAL_CLOCK, render_stream
from .wav import load_wav_mono, resample_to, save_wav

FRAME_RATE_HZ = 50.0  # PAL play-call rate
NUM_VOICES = 3

# Per-voice register addresses.
_VOICE_REGS = [
    (
        int(W.Voice1_Freq_Lo),
        int(W.Voice1_Freq_Hi),
        int(W.Voice1_Control_Reg),
        int(W.Voice1_Attack_Decay),
        int(W.Voice1_Sustain_Release),
    ),
    (
        int(W.Voice2_Freq_Lo),
        int(W.Voice2_Freq_Hi),
        int(W.Voice2_Control_Reg),
        int(W.Voice2_Attack_Decay),
        int(W.Voice2_Sustain_Release),
    ),
    (
        int(W.Voice3_Freq_Lo),
        int(W.Voice3_Freq_Hi),
        int(W.Voice3_Control_Reg),
        int(W.Voice3_Attack_Decay),
        int(W.Voice3_Sustain_Release),
    ),
]

SAW = 0x21  # sawtooth + gate
# Static envelope: instant attack, full sustain, so each voice is a steady tone.
PRESET: Tuple[Tuple[int, int], ...] = tuple(
    item for fl, fh, ctrl, ad, sr in _VOICE_REGS for item in ((ad, 0x00), (sr, 0xF0))
)


def hz_to_sidfreq(hz: float, clock: float = PAL_CLOCK) -> int:
    """SID frequency register value for a desired output frequency (16-bit)."""
    # f_out = Fn * clock / 16777216  =>  Fn = f_out * 16777216 / clock
    fn = int(round(hz * 16777216.0 / clock))
    return max(0, min(0xFFFF, fn))


def _detect_pitch(chunk: np.ndarray, sr: float) -> float:
    """Autocorrelation pitch estimate (Hz) -- robust for a single tone."""
    if len(chunk) < 16 or np.max(np.abs(chunk)) < 1e-4:
        return 0.0
    x = chunk - chunk.mean()
    ac = np.correlate(x, x, mode="full")[len(x) - 1 :]
    if ac[0] <= 0:
        return 0.0
    ac = ac / ac[0]
    # search lags for 50..1200 Hz (musical range)
    lo = max(1, int(sr / 1200.0))
    hi = min(len(ac) - 1, int(sr / 50.0))
    if hi <= lo + 2:
        return 0.0
    # pick the FIRST autocorrelation peak above threshold (the fundamental),
    # not the global max -- the global max can land on a harmonic multiple.
    seg = ac[lo:hi]
    thr = 0.5 * float(seg.max())
    peak_lag = lo + int(np.argmax(seg))
    for k in range(1, len(seg) - 1):
        if seg[k] > thr and seg[k] >= seg[k - 1] and seg[k] > seg[k + 1]:
            peak_lag = lo + k
            break
    return float(sr / peak_lag)


def _frame_pitches(chunk: np.ndarray, sr: float, n: int) -> List[float]:
    """Dominant pitch (and octave fillers) for a frame; voice 1 carries it."""
    f0 = _detect_pitch(chunk, sr)
    if f0 <= 0.0:
        return []
    # put the fundamental on voice 1; leave others silent for a clean tone
    return [f0] + [0.0] * (n - 1)


def encode(wav_path: str, chip_model: str = "8580") -> List[Event]:
    """Per 50 Hz frame, choose voice frequencies + master volume to resynthesize."""
    analysis_sr = 11025.0
    mono, sr = load_wav_mono(wav_path)
    res = resample_to(mono, sr, analysis_sr)
    spf = int(round(analysis_sr / FRAME_RATE_HZ))  # samples per frame
    nframes = max(1, len(res) // spf)

    stream: List[Event] = []
    gated = [False] * NUM_VOICES

    for fidx in range(nframes):
        chunk = res[fidx * spf : (fidx + 1) * spf]
        rms = float(np.sqrt(np.mean(chunk**2))) if len(chunk) else 0.0
        vol = int(np.clip(round(rms * 4.0 * 15.0), 0, 15))
        pitches = _frame_pitches(chunk, analysis_sr, NUM_VOICES)
        tick = fidx  # one tick per frame
        for v, (fl, fh, ctrl, ad, srr) in enumerate(_VOICE_REGS):
            hz = pitches[v] if v < len(pitches) else 0.0
            if hz > 0.0:
                fn = hz_to_sidfreq(hz)
                stream.append((tick, fl, fn & 0xFF))
                stream.append((tick, fh, (fn >> 8) & 0xFF))
                if not gated[v]:
                    stream.append((tick, ctrl, SAW))
                    gated[v] = True
            elif gated[v]:
                stream.append((tick, ctrl, SAW & ~0x01))  # gate off -> release
                gated[v] = False
        stream.append((tick, MODE_VOL, vol))
    return stream


def render(stream, chip_model: str = "8580") -> np.ndarray:
    """Drive a real SID at the 50 Hz frame cadence with resynthesis params."""
    return render_stream(stream, rate_hz=FRAME_RATE_HZ, model=chip_model, preset=PRESET)


def main(argv=None) -> int:
    import argparse

    ap = argparse.ArgumentParser(description="Frodigi-style oscillator resynthesis player")
    ap.add_argument("wav_in")
    ap.add_argument("wav_out")
    ap.add_argument("--chip", default="8580", choices=["6581", "8580"])
    args = ap.parse_args(argv)
    stream = encode(args.wav_in, chip_model=args.chip)
    pcm = render(stream, chip_model=args.chip)
    save_wav(args.wav_out, pcm, 44100)
    print(f"wrote {args.wav_out}: {len(pcm)} samples (Frodigi resynthesis, {args.chip})")
    return 0


if __name__ == "__main__":  # pragma: no cover
    raise SystemExit(main())
