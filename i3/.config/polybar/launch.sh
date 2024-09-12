#!/bin/bash
killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar main -c $HOME/.config/polybar/config.ini >> /tmp/polybar.log &
polybar left -c $HOME/.config/polybar/config.ini >> /tmp/polybar.log &
polybar right -c $HOME/.config/polybar/config.ini >> /tmp/polybar.log &
