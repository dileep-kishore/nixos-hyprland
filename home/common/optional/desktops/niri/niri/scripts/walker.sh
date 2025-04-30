#!/usr/bin/env zsh

export ANTHROPIC_API_KEY=$(cat ~/.secrets/anthropic_api_key.txt)
export PATH="$PATH:$HOME/.local/bin:/var/lib/flatpak/exports/bin:$HOME/.nix-profile/bin"

walker
