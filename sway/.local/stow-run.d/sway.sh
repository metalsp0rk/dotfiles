#!/usr/bin/env bash

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

if  [ "${machine}" == "Linux" ] ;
then
  sudo pacman -S --needed base-devel git
  # install and configure interception
  yay -S --needed interception-tools interception-caps2esc interception-dual-function-keys waybar wttrbar light mako noto-fonts-emoji wlsunset kanshi
  sudo mkdir -pv /etc/interception/udevmon.d /etc/interception/dual-function-keys/
  echo "Adding user to video group for backlight control"
  sudo usermod -aG video $(whoami)
  cat <<EOF | sudo tee /etc/interception/udevmon.d/caps.yaml
- JOB: "intercept -g \$DEVNODE | dual-function-keys -c /etc/interception/dual-function-keys/caps.yaml | uinput -d \$DEVNODE"
  DEVICE:
    NAME: "AT Translated Set 2 keyboard"
EOF
  cat <<EOF | sudo tee /etc/interception/dual-function-keys/caps.yaml
MAPPINGS:
  - KEY: KEY_CAPSLOCK
    TAP: KEY_ESC
    HOLD: KEY_LEFTMETA
EOF
  sudo systemctl enable udevmon
  sudo systemctl restart udevmon
  systemctl --user enable mako
  systemctl --user start mako
fi



