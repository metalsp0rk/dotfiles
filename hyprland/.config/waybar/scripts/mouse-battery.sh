#!/usr/bin/env bash
OUTPUT=$(solaar show 2>/dev/null | grep Battery: | sed 1q | awk ' { print $2; } ')

# printf '{"text": "%s", "alt": "Mouse Battery"}\n' "$OUTPUT"
echo "$OUTPUT"
