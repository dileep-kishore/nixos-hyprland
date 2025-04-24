#!/usr/bin/env bash

PLUGIN_DIR="$HOME/.config/zellij/plugins"

mkdir -p "$PLUGIN_DIR"

wget https://github.com/dj95/zjstatus/releases/latest/download/zjstatus.wasm -O "$PLUGIN_DIR/zjstatus.wasm"
wget https://github.com/dj95/zjstatus/releases/latest/download/zjframes.wasm -O "$PLUGIN_DIR/zjframes.wasm"
wget https://github.com/karimould/zellij-forgot/releases/latest/download/zellij_forgot.wasm -O "$PLUGIN_DIR/zellij_forgot.wasm"

# TODO: Autolock
