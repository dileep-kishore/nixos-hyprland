#!/usr/bin/env bash

uptime | awk '{print $3"D", substr($5, 1, index($5, ":")-1)"H"}'
