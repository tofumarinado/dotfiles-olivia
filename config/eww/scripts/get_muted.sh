#!/bin/bash
if pactl get-sink-mute @DEFAULT_SINK@ 2>/dev/null | grep -q 'Mute: yes'; then
  echo "true"
else
  echo "false"
fi
