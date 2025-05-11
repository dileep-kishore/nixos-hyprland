#!/usr/bin/env bash
# Pure cliphist implementation for Walker
# Newest-first entries with clean formatting

history = $(cliphist list | tac)
while IFS=$'\t' read -r id content; do
    # Clean preview text (single line, 80 char limit)
    preview=$(echo "$history" | tr '\n' ' ' | cut -c 1-80)
    # Remove special characters that might break TOML
    safe_preview=$(echo "$preview" | sed 's/"/\\"/g')

    printf "label=\"${safe_preview}...\";\n"
    printf "exec=echo \"${entry}\" | cliphist decode | wl-copy;\n"
    printf "tooltip=\"Paste this clipboard entry\";\n\n"
done <<<"$history"
# Output Walker module entry
