#!/usr/bin/env bash

# Get the output of the uptime command
uptime_output=$(uptime | jc --uptime)

# Use jq to extract uptime_days and uptime_hours
uptime_days=$(echo "$uptime_output" | jq '.uptime_days')
uptime_hours=$(echo "$uptime_output" | jq '.uptime_hours')

# Format the output as "XD YH"
echo "${uptime_days} days ${uptime_hours} hours"
