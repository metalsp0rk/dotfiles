#!/usr/bin/env bash

MODE=$(kanshictl status | awk -F':' ' { print $2 } ' | tr -d '[:space:]')

# echo "$MODE"

case $MODE in
framework-mobile)
  echo ""
  ;;
framework-docked)
  echo "󰍹"
  ;;
*)
  echo "󰍹"
  ;;
esac
