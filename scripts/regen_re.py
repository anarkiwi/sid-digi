#!/usr/bin/env python3
"""Regenerate the RE (reverse-engineering) artifacts under ``re/<player>/``.

For each representative digi tune we download the ``.sid`` from a public HVSC
mirror into the gitignored ``.sidcache/`` (see ``scripts/fetch_sids.py``) -- the
raw tunes are never committed -- then drive *deplayroutine* (the
Ghidra-in-Docker SID RE framework) to produce a disassembly, decompilation,
symbol map and siddump oracle trace.  If
deplayroutine / Docker is unavailable, a pure-Python fallback (the
``sidtrace``-style register/siddump trace shipped here, or deplayroutine's own
no-Docker control-flow tracer if importable) still emits a usable register
trace so the repo is never blocked.

Nothing is copied from any other RE tree -- artifacts are generated fresh here.

Usage::

    python scripts/regen_re.py            # all players, deplayroutine if present
    python scripts/regen_re.py --fallback # force the pure-Python fallback
"""

from __future__ import annotations

import argparse
import json
import os
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
RE_DIR = REPO / "re"

sys.path.insert(0, str(REPO))
from scripts.fetch_sids import PLAYERS as HVSC_PATHS, fetch  # noqa: E402

DEPLAY = Path(os.environ.get("DEPLAYROUTINE", ""))

# player-id -> (HVSC relative path, mechanism note).  The HVSC paths live in
# scripts/fetch_sids.py (the download helper); we only add the mechanism note.
_NOTES = {
    "mahoney_8bit": "Mahoney 8-bit ($D418 + 3-voice DC env), 8580",
    "d418_4bit": "classic 4-bit $D418 game-digi drums",
    "galway": "Galway-style 4-bit $D418 sample player",
    "frodigi": "Frodigi oscillator-resynthesis digi, 8580",
}
PLAYERS = {pid: (HVSC_PATHS[pid], _NOTES[pid]) for pid in HVSC_PATHS}


def have_deplayroutine() -> bool:
    if not DEPLAY.name or not (DEPLAY / "bin" / "deplayroutine").exists():
        return False
    try:
        subprocess.run(["docker", "info"], check=True, capture_output=True, timeout=20)
    except Exception:
        return False
    return True


def run_deplayroutine(player: str, sid_src: Path, out: Path) -> bool:
    """Make a temp deplayroutine target for ``sid_src`` and run the pipeline."""
    tgt_root = DEPLAY / "targets" / f"_sid_digi_{player}"
    tunes = tgt_root / "tunes"
    tunes.mkdir(parents=True, exist_ok=True)
    shutil.copy2(sid_src, tunes / sid_src.name)
    (tgt_root / "target.json").write_text(
        json.dumps(
            {
                "name": f"_sid_digi_{player}",
                "description": f"sid-digi RE: {player} ({sid_src.name})",
                "tune": f"tunes/{sid_src.name}",
                "base": "from-header",
                "entries": "from-header",
                "language": "6502:LE:16:default",
            },
            indent=2,
        )
    )
    try:
        subprocess.run(
            ["python3", "bin/deplayroutine", "run", f"_sid_digi_{player}"],
            cwd=DEPLAY,
            check=True,
            timeout=1200,
        )
    except Exception as exc:  # pragma: no cover - environment dependent
        print(f"  deplayroutine failed for {player}: {exc}", file=sys.stderr)
        shutil.rmtree(tgt_root, ignore_errors=True)
        return False

    src_out = DEPLAY / "out" / f"_sid_digi_{player}"
    for fn in ("disasm.asm", "decompile.c", "symbols.json", "siddump.txt", "meta.txt"):
        f = src_out / fn
        if f.exists():
            shutil.copy2(f, out / fn)
    shutil.rmtree(tgt_root, ignore_errors=True)
    return True


def run_fallback(sid_src: Path, out: Path) -> None:
    """Pure-Python register trace via the repo's sidtrace fallback."""
    from scripts.sidtrace_fallback import trace_sid

    text = trace_sid(str(sid_src), frames=600)
    (out / "siddump_fallback.txt").write_text(text)


def main(argv=None) -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--fallback", action="store_true", help="force pure-Python fallback")
    ap.add_argument("--player", help="only this player id")
    args = ap.parse_args(argv)

    use_deplay = (not args.fallback) and have_deplayroutine()
    print(f"deplayroutine available: {use_deplay}")

    players = {args.player: PLAYERS[args.player]} if args.player else PLAYERS

    for player, (rel, note) in players.items():
        out = RE_DIR / player
        out.mkdir(parents=True, exist_ok=True)
        try:
            sid_src = fetch(rel)  # download to the gitignored .sidcache/
        except Exception as exc:  # pragma: no cover - network dependent
            print(f"  FETCH FAILED {rel} ({exc}); skipping {player}")
            continue
        # The raw .sid is NEVER copied into the repo tree; only RE artifacts.
        (out / "SOURCE.txt").write_text(
            f"player: {player}\nmechanism: {note}\nhvsc: {rel}\n"
            f"regenerate: python scripts/regen_re.py --player {player}\n"
        )
        ran = use_deplay and run_deplayroutine(player, sid_src, out)
        if not ran:
            run_fallback(sid_src, out)
        print(f"  {player}: {'deplayroutine' if ran else 'fallback'} -> {out}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
