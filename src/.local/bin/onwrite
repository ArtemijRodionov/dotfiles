#! /usr/bin/env python3
import select
import argparse
import platform
import os
import contextlib
import subprocess

system = platform.system()
if not (system == "Darwin" or "BSD" in system):
    print("WARN: It requires kqueue.")


@contextlib.contextmanager
def close(xs):
    try:
        yield xs
    finally:
        for x in xs:
            x.close()


def check_paths(paths):
    for p in paths:
        if not os.path.exists(p):
            raise RuntimeError(f"Given file doesn't exist: {p}")


def create_event(file):
    return select.kevent(
        ident=file,
        filter=select.KQ_FILTER_VNODE,
        flags=select.KQ_EV_ADD | select.KQ_EV_CLEAR,
        fflags=select.KQ_NOTE_WRITE
    )
 

parse = argparse.ArgumentParser("Watch for files changes and run a command")
parse.add_argument("command")
parse.add_argument("files", nargs="+")
args = parse.parse_args()
check_paths(args.files)

with close([select.kqueue()] + [open(f) for f in args.files]) as (kq, *files):
    events = [create_event(f) for f in files]
    max_events = len(files)
    kq.control(events, 0)
    while True:
        kq.control([], max_events)
        subprocess.run(args.command, shell=True)

