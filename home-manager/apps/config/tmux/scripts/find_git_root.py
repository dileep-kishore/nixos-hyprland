#!/usr/bin/env python3
import os
import subprocess
import sys


def get_git_root():
    try:
        # Get the absolute path of the Git repository root
        git_root = (
            subprocess.check_output(
                ["git", "rev-parse", "--show-toplevel"], stderr=subprocess.STDOUT
            )
            .strip()
            .decode("utf-8")
        )
        # Get $HOME directory
        home_dir = os.getenv("HOME", "")
        return git_root.replace(home_dir, "~")
    except subprocess.CalledProcessError:
        # Not in a Git repository
        return None


def truncate_path(path, levels=5):
    # Get $HOME directory
    home_dir = os.getenv("HOME", "")
    # Split the path into parts
    parts = path.replace(home_dir, "~").split(os.sep)
    # Truncate to the desired number of levels
    truncated = str(os.sep.join(parts[-levels:]))
    if levels < len(parts):
        truncated = "../" + truncated
    return truncated


# Main execution
if __name__ == "__main__":
    cwd = sys.argv[1]
    os.chdir(cwd)
    git_root = get_git_root()
    if git_root:
        print(git_root)
    else:
        # Not in a Git repo, so truncate the current path
        current_path = os.getcwd()
        truncated_path = truncate_path(current_path)
        print(truncated_path)
