#!/usr/bin/env bash

TYPE=$1 # region, activewindow, activemonitor
OUTPUT_FILE=~/Pictures/Screenshots/$1-$(date +%F_%T).png
NOTIFCATION_TEXT="Screenshot of the $1 taken"
ACTIVE_MONITOR=$(hyprctl -j activeworkspace | jq -r '(.monitor)')
ACTIVE_WINDOW=$(hyprctl -j activewindow | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')

if [ "$TYPE" == "region" ]; then
	grim -g "$(slurp)" - | wl-copy && wl-paste >$OUTPUT_FILE | notify-send "$NOTIFCATION_TEXT" -t 1000
elif [ "$TYPE" == "activewindow" ]; then
	grim -g "$ACTIVE_WINDOW" - | wl-copy && wl-paste >$OUTPUT_FILE | notify-send "$NOTIFCATION_TEXT" -t 1000
elif [ "$TYPE" == "activemonitor" ]; then
	grim -o "$ACTIVE_MONITOR" - | wl-copy && wl-paste >$OUTPUT_FILE | notify-send "$NOTIFCATION_TEXT" -t 1000
else
	grim | wl-copy && wl-paste >$OUTPUT_FILE | notify-send "$NOTIFCATION_TEXT" -t 1000
fi
