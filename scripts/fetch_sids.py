#!/usr/bin/env python3
"""Download HVSC ``.sid`` tunes into a gitignored local cache.

The RE'd digi tunes are HVSC copyright works and are **never** committed to this
repo.  Instead we fetch them on demand from a public HVSC mirror into
``.sidcache/`` (gitignored).  Everything works from a fresh clone -- no machine
specific paths.

Usage::

    python scripts/fetch_sids.py                 # fetch every RE'd tune
    python scripts/fetch_sids.py --player galway # fetch one
    python scripts/fetch_sids.py --list          # print id -> HVSC path

Programmatic::

    from scripts.fetch_sids import fetch, PLAYERS
    sid_path = fetch("MUSICIANS/M/Mahoney/Smold.sid")
"""

from __future__ import annotations

import argparse
import os
import sys
import urllib.request
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
CACHE = Path(os.environ.get("SIDCACHE", str(REPO / ".sidcache")))

# Public HVSC mirror.  Override with ``$HVSC_MIRROR``.  The relative HVSC path is
# appended verbatim (e.g. ``MUSICIANS/M/Mahoney/Smold.sid``).
MIRROR = os.environ.get("HVSC_MIRROR", "https://hvsc.brona.dk/HVSC/C64Music").rstrip("/")

# player-id -> HVSC relative path (the canonical source of each RE'd tune).
PLAYERS = {
    "mahoney_8bit": "MUSICIANS/M/Mahoney/Smold.sid",
    "d418_4bit": "MUSICIANS/M/MC/Nemesis_the_Warlock.sid",
    "galway": "MUSICIANS/A/Alfatech/Galway-tune.sid",
    "frodigi": "MUSICIANS/K/Khugiani_Naveed/FRODIGI.sid",
}


def _is_sid(data: bytes) -> bool:
    return data[:4] in (b"PSID", b"RSID")


def fetch(relpath: str, *, force: bool = False) -> Path:
    """Fetch ``relpath`` from the HVSC mirror into the cache; return its path.

    Cached on disk; re-downloads only with ``force``.  Validates the PSID/RSID
    magic so a captive-portal/HTML error page is never silently cached.
    """
    relpath = relpath.lstrip("/")
    dest = CACHE / relpath
    if dest.exists() and not force:
        return dest

    url = f"{MIRROR}/{relpath}"
    req = urllib.request.Request(url, headers={"User-Agent": "sid-digi/fetch_sids"})
    with urllib.request.urlopen(req, timeout=60) as resp:  # nosec B310 (https mirror)
        data = resp.read()
    if not _is_sid(data):
        raise RuntimeError(f"{url}: not a SID file (magic {data[:4]!r})")

    dest.parent.mkdir(parents=True, exist_ok=True)
    dest.write_bytes(data)
    return dest


def fetch_player(player: str, *, force: bool = False) -> Path:
    """Fetch the tune RE'd under ``re/<player>/`` into the cache."""
    return fetch(PLAYERS[player], force=force)


def main(argv=None) -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--player", help="only this player id")
    ap.add_argument("--force", action="store_true", help="re-download even if cached")
    ap.add_argument("--list", action="store_true", help="print id -> HVSC path and exit")
    args = ap.parse_args(argv)

    if args.list:
        for pid, rel in PLAYERS.items():
            print(f"{pid}\t{rel}")
        return 0

    players = [args.player] if args.player else list(PLAYERS)
    for pid in players:
        path = fetch_player(pid, force=args.force)
        print(f"{pid}: {PLAYERS[pid]} -> {path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
