DPMS=$(xset q | grep timeout: | awk ' { print $2 } ')

if [[ "$DPMS" -eq "0" ]]; then
  echo "󰌾"
else
  echo "󰌿"
fi
