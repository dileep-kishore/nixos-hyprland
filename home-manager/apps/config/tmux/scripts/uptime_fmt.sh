#!/usr/bin/env bash

uptime | grep -oP '\d+ days \d+' | sed 's/ \([0-9]\+\)$/ \1 hours/'
