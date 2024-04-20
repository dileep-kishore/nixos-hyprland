default:
    @just --list --unsorted

host := `uname -n`
user := `whoami`
alias bs := build_switch
alias hs := home_switch
alias u := update
alias uc := update_commit

# Build nixos
build_switch:
    nixos-rebuild switch --flake .#{{host}}

# Build home-manager
home_switch:
    home-manager switch --flake .#{{user}}@{{host}}

# Show neovim flake output
show:
    nix flake show

# Commit flake.lock
commit_lock:
    git add flake.lock
    git commit -m "chore: update flake"

# Update flake
update:
    nix flake update

# Update flake and commit flake.lock
update_commit: update commit_lock

# Check flake
check:
    nix flake check
