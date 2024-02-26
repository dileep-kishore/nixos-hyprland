#!/usr/bin/env bash
# A rebuild script that commits on a successful build
set -e

pushd ~/dotfiles/nixos/
nvim oatman-pc.nix
alejandra . &>/dev/null
git diff -U0 *.nix
echo "NixOS Rebuilding..."
sudo nixos-rebuild switch --impure --flake /etc/nixos/#default &>nixos-switch.log || (cat nixos-switch.log | grep --color error && false)
current=$(nixos-rebuild list-generations | grep current)
git commit -am "$current"
popd
notify-send -e "NixOS Rebuilt OK!" --icon=software-update-available
