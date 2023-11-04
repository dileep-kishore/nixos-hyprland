#!/usr/bin/env bash

font=$1
mkdir -p ~/.local/share/fonts
cp "$font" ~/.local/share/fonts
fc-cache
# Verify that the font has been installed
fc-list -v | grep -i "${font%.*}"
