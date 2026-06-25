#!/usr/bin/env python3
"""Pure-Python SID register tracer (no Docker, no external playroutine).

A standalone fallback oracle for :mod:`scripts.regen_re` when deplayroutine /
Docker is unavailable.  It parses a PSID/RSID file, runs the player's init and
play routines on a py65 6502 emulator, and records every write to the SID
register page (``$D400-$D418``).

Crucially it can dump **per play-call** (the conventional once-per-frame view,
which MISSES digis) *and* count the raw write rate -- a digi shows up as a flood
of ``$D418`` (or pulse-width) writes per frame, exactly the sub-frame cadence a
frame-sampling oracle like siddump cannot represent.  This makes the "why
siddump misses digis" point concrete and reproducible.
"""

from __future__ import annotations

import struct
import sys
from collections import Counter
from typing import List, Tuple

from py65.devices.mpu6502 import MPU


SID_BASE = 0xD400
SID_END = 0xD41C


def parse_sid(path: str):
    """Return (load_addr, init_addr, play_addr, data_bytes, is_rsid)."""
    raw = open(path, "rb").read()
    magic = raw[:4]
    if magic not in (b"PSID", b"RSID"):
        raise ValueError(f"not a SID file: {magic!r}")
    data_offset = struct.unpack(">H", raw[6:8])[0]
    load, init, play = struct.unpack(">HHH", raw[8:14])
    body = raw[data_offset:]
    if load == 0:  # load address is first 2 bytes of body (little-endian)
        load = body[0] | (body[1] << 8)
        body = body[2:]
    return load, init, play, body, magic == b"RSID"


class SidMachine:
    """py65 MPU with RAM + a SID register-write log."""

    def __init__(self):
        self.mpu = MPU()
        self.ram = bytearray(0x10000)
        self.writes: List[Tuple[int, int]] = []
        self.mpu.memory = self  # MPU indexes us like a list

    # py65 memory protocol -------------------------------------------------
    def __getitem__(self, addr):
        if isinstance(addr, slice):
            return self.ram[addr]
        return self.ram[addr]

    def __setitem__(self, addr, value):
        if isinstance(addr, slice):
            self.ram[addr] = value
            return
        if SID_BASE <= addr <= SID_END:
            self.writes.append((addr, value & 0xFF))
        self.ram[addr] = value & 0xFF

    def __len__(self):
        return len(self.ram)

    # helpers --------------------------------------------------------------
    def load(self, load_addr, body):
        self.ram[load_addr : load_addr + len(body)] = body

    def _call(self, addr, a=0, max_cycles=2_000_000):
        """JSR-style call: push a sentinel return, run until RTS to it."""
        self.mpu.a = a & 0xFF
        self.mpu.x = self.mpu.y = 0
        self.mpu.sp = 0xFF
        ret = 0x0001  # sentinel; RTS lands at $0002
        self.ram[0x01FF] = (ret >> 8) & 0xFF
        self.ram[0x01FE] = ret & 0xFF
        self.mpu.sp = 0xFD
        self.mpu.pc = addr
        cycles = 0
        while cycles < max_cycles:
            if self.mpu.pc == (ret + 1):  # returned to sentinel+1
                break
            before = self.mpu.processorCycles
            self.mpu.step()
            cycles += self.mpu.processorCycles - before
        return cycles


def trace_sid(path: str, frames: int = 600) -> str:
    """Run init + N play calls; return a human-readable trace report."""
    load, init, play, body, is_rsid = parse_sid(path)
    m = SidMachine()
    m.load(load, body)

    lines: List[str] = []
    lines.append("# pure-Python SID register trace (py65 fallback oracle)")
    lines.append(f"# file: {path}")
    lines.append(
        f"# load=${load:04X} init=${init:04X} play=${play:04X} {'RSID' if is_rsid else 'PSID'}"
    )
    lines.append("")

    per_frame_writes: List[int] = []
    reg_hist: Counter = Counter()

    if play == 0:
        # RSID / interrupt-driven player: there is no separate play routine; the
        # init code installs its own IRQ/NMI and loops forever.  We can't safely
        # JSR it, so we single-step a fixed cycle budget and bucket the SID
        # writes into pseudo-frames (~19656 PAL cycles each) to expose the rate.
        lines.append("# play address is 0 -> interrupt-driven (RSID) player.")
        lines.append("# stepping a fixed cycle budget and bucketing writes into PAL frames.")
        lines.append("")
        m.mpu.pc = init
        m.mpu.sp = 0xFD
        cyc_per_frame = 19656
        budget = cyc_per_frame * frames
        cyc = 0
        frame_acc = 0
        last_frame_cyc = 0
        steps = 0
        while cyc < budget and steps < 50_000_000:
            before = m.mpu.processorCycles
            try:
                m.mpu.step()
            except Exception:
                break
            cyc += m.mpu.processorCycles - before
            steps += 1
            if cyc - last_frame_cyc >= cyc_per_frame:
                per_frame_writes.append(len(m.writes) - frame_acc)
                frame_acc = len(m.writes)
                last_frame_cyc = cyc
        for reg, _val in m.writes:
            reg_hist[reg] += 1
    else:
        try:
            m._call(init, a=0)
        except Exception as exc:  # pragma: no cover
            lines.append(f"# init aborted: {exc}")
        for fr in range(frames):
            m.writes.clear()
            try:
                m._call(play)
            except Exception:
                break
            per_frame_writes.append(len(m.writes))
            for reg, _val in m.writes:
                reg_hist[reg] += 1

    total = sum(per_frame_writes)
    nframes = max(1, len(per_frame_writes))
    d418 = reg_hist.get(0xD418, 0)
    lines.append(f"# frames traced: {nframes}")
    lines.append(f"# total SID writes: {total}  ($D418 writes: {d418})")
    lines.append(f"# mean writes/frame: {total / nframes:.1f}")
    lines.append(f"# max writes/frame:  {max(per_frame_writes) if per_frame_writes else 0}")
    lines.append("")
    lines.append("# DIGI INDICATOR: many $D418 (or pulse-width) writes PER FRAME means")
    lines.append("# the player streams PCM at a sub-frame rate -- a once-per-frame oracle")
    lines.append("# (siddump) would record only the LAST value each frame and miss it.")
    lines.append("")
    lines.append("# register write histogram (addr: count over all frames):")
    for reg in sorted(reg_hist):
        lines.append(f"#   ${reg:04X}: {reg_hist[reg]}")
    return "\n".join(lines) + "\n"


def main(argv=None) -> int:
    argv = argv if argv is not None else sys.argv[1:]
    if not argv:
        print("usage: sidtrace_fallback.py <file.sid> [out.txt] [frames]", file=sys.stderr)
        return 2
    path = argv[0]
    frames = int(argv[2]) if len(argv) > 2 else 600
    text = trace_sid(path, frames=frames)
    if len(argv) > 1:
        open(argv[1], "w").write(text)
        print(f"wrote {argv[1]}")
    else:
        sys.stdout.write(text)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
