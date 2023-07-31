#!/bin/sh

# The volume_change event supplies a $INFO variable in which the current volume
# percentage is passed to the script.

VOLUME=$(osascript -e 'output volume of (get volume settings)')

case $VOLUME in
  [6-9][0-9]|100) ICON="󰕾"
  ;;
  [3-5][0-9]) ICON="󰖀"
  ;;
  [1-9]|[1-2][0-9]) ICON="󰕿"
  ;;
  *) ICON="󰖁"
esac

if $(osascript -e 'output muted of (get volume settings)' 2>/dev/null); then
  ICON="󰖁"
fi


sketchybar --set $NAME icon="$ICON" label="$VOLUME%"
