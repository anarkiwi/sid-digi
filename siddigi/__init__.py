"""sid-digi: first-principles C64 SID digi (PCM/sample) playback techniques.

Each technique module exposes ``encode(wav_path) -> [(tick, reg, val), ...]``
and ``render(stream, chip_model) -> int16 samples``, driving pyresidfp / reSIDfp
directly (no external playroutine binary in the playback path).

See :data:`TECHNIQUES` for the registry and ``README.md`` for the mechanism
reference table.
"""

from __future__ import annotations

from . import d418_4bit, frodigi, galway, mahoney_8bit, pulse_dc

__all__ = ["d418_4bit", "mahoney_8bit", "pulse_dc", "galway", "frodigi", "TECHNIQUES"]

# name -> (module, one-line mechanism, default chip)
TECHNIQUES = {
    "d418_4bit": (d418_4bit, "4-bit master-volume DAC streamed to $D418", "6581"),
    "mahoney_8bit": (mahoney_8bit, "8-bit via measured $D418 table + 3-voice DC env", "8580"),
    "pulse_dc": (pulse_dc, "test-bit-frozen pulse, per-sample pulse-width DC", "8580"),
    "galway": (galway, "CPU-paced packed-nibble 4-bit $D418 PCM", "6581"),
    "frodigi": (frodigi, "per-frame oscillator resynthesis (not PCM)", "8580"),
}
