#!/bin/bash
pactl set-default-sink "$1"
# Move already-running streams to the new output
for input in $(pactl list short sink-inputs 2>/dev/null | cut -f1); do
  pactl move-sink-input "$input" "$1" 2>/dev/null
done
