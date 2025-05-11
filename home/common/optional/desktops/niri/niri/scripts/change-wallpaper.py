#!/usr/bin/env python3

import os
import subprocess
import time
from itertools import cycle

WALLPAPERS_DIR = os.path.expanduser("~/Pictures/wallpapers/")
WALLPAPER_NAMES = [
    "bluewave.png",
    "nixppuccin.png",
    "black-hole.png",
    "galaxy.png",
    "sushi-dark.png",
]


def set_wallpaper(wallpaper):
    subprocess.run(
        [
            "swww",
            "img",
            wallpaper,
            "--transition-type",
            "grow",
        ]
    )


def main():
    wallpapers = [os.path.join(WALLPAPERS_DIR, name) for name in WALLPAPER_NAMES]
    wallpaper_cycle = cycle(wallpapers)
    for wallpaper in wallpaper_cycle:
        print(f"Setting wallpaper to {wallpaper}")
        set_wallpaper(wallpaper)
        time.sleep(3600)


if __name__ == "__main__":
    main()
