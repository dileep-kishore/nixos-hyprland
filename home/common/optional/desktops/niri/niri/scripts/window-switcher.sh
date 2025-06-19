#!/usr/bin/env bash

# App ID to switch to
BROWSER_APP_ID=$1 # eg. "Vivaldi-stable"

# Get the window ID of the application
WINDOW_ID=$(niri msg -j windows | jq "[.[] | select(.app_id | test(\"$BROWSER_APP_ID\"))] | sort_by(.id) | .[0].id")

if [ -n "$WINDOW_ID" ]; then
    echo "Switching to $BROWSER_APP_ID window with ID: $WINDOW_ID"
    niri msg action focus-window --id "$WINDOW_ID"
fi
