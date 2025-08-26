#!/usr/bin/env zsh


WINDOWS=

ON=
OFF=

STATE=$(sudo virsh list --all | grep win10 | awk ' { print $3 } ')

if [ "$STATE" = "running" ]; then
  echo "$WINDOWS $ON"
else
  echo "$WINDOWS $OFF"
fi
