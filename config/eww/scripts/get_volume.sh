#!/bin/bash
pactl get-sink-volume @DEFAULT_SINK@ 2>/dev/null | grep -oP '[0-9]+%' | head -1 | tr -d '%'
