#!/usr/bin/env bash

PLUGIN_DIR="$HOME/.config/zellij/plugins"

mkdir -p "$PLUGIN_DIR"

aria2c --allow-overwrite=true -d "$PLUGIN_DIR" -o zjstatus.wasm https://github.com/dj95/zjstatus/releases/latest/download/zjstatus.wasm
aria2c --allow-overwrite=true -d "$PLUGIN_DIR" -o zjframes.wasm https://github.com/dj95/zjstatus/releases/latest/download/zjframes.wasm
aria2c --allow-overwrite=true -d "$PLUGIN_DIR" -o zellij_forgot.wasm https://github.com/karimould/zellij-forgot/releases/latest/download/zellij_forgot.wasm
aria2c --allow-overwrite=true -d "$PLUGIN_DIR" -o zellij-autolock.wasm https://github.com/fresh2dev/zellij-autolock/releases/latest/download/zellij-autolock.wasm
aria2c --allow-overwrite=true -d "$PLUGIN_DIR" -o zellij-choose-tree.wasm https://github.com/laperlej/zellij-choose-tree/releases/latest/download/zellij-choose-tree.wasm
