#!/bin/bash
pactl --format=json list sinks 2>/dev/null | python3 -c '
import json, sys, subprocess

try:
    sinks = json.load(sys.stdin)
except Exception:
    print("[]")
    sys.exit(0)

try:
    default = subprocess.run(
        ["pactl", "get-default-sink"], capture_output=True, text=True
    ).stdout.strip()
except Exception:
    default = ""

out = []
for s in sinks:
    name = s.get("name", "")
    out.append({
        "name": name,
        "description": s.get("description", name),
        "active": name == default,
    })
print(json.dumps(out))
'
