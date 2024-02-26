#!/usr/bin/env bash

# Get the output of the uptime command
uptime_output=$(uptime)

# Use sed to extract days and hours, handling both cases when days are present and not
days_hours=$(echo "$uptime_output" | sed -n 's/.*up \+\([0-9]\+\) days, \+\([0-9]\+\):.*/\1D \2H/p')

# If days are not present, just get the hours
if [ -z "$days_hours" ]; then
	days_hours=$(echo "$uptime_output" | sed -n 's/.*up \+\([0-9]\+\):.*/0D \1H/p')
fi

echo "$days_hours"
