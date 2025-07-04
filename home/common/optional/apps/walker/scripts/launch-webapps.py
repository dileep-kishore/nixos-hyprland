#!/usr/bin/env python3

import subprocess

LIST = [
    "https://perplexity.ai",
    "https://gemini.google.com",
    "https://github.com/dileep-kishore",
]


def create_string(item: str) -> str:
    label = f"label={item.removeprefix('https://')}"
    exec = f'exec=brave --app=\\"{item}\\"'
    cmd = f"{label};{exec};matching=1;"
    return cmd


def main():
    for item in LIST:
        print(create_string(item))


if __name__ == "__main__":
    main()
