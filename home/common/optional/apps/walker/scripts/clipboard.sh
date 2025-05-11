#!/bin/bash
# Clipboard module for Walker using cliphist and wl-copy

# Get clipboard history (limit to 50 most recent entries)
history=$(cliphist list | cat | head -n 10)

while IFS=$'\t' read -r content; do
    # Extract first 100 chars for preview (replace newlines with spaces)
    preview=$(echo "$content" | tr '\n' ' ' | cut -c 1-100)

    # Remove special characters that might break TOML
    safe_preview=$(echo "$preview" | sed 's/"/\\"/g')

    printf "label=\"${safe_preview}...\";\n"
    printf "exec=echo \"${content}\" | cliphist decode | wl-copy;\n"
    printf "tooltip=\"Paste this clipboard entry\";\n\n"
done <<<"$history"
