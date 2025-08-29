#!/usr/bin/env bash

unameOut="$(uname -s)"
case "${unameOut}" in
Linux*) machine=Linux ;;
Darwin*) machine=Mac ;;
CYGWIN*) machine=Cygwin ;;
MINGW*) machine=MinGw ;;
*) machine="UNKNOWN:${unameOut}" ;;
esac

if [ "${machine}" == "Linux" ]; then

  yay --noconfirm --needed -S noto-fonts-emoji waybar wttrbar light wlsunset kanshi wmenu swww ttf-sourcecodepro-nerd newaita-icons-git ttf-md-fonts-git ttf-font-awesome awesome-terminal-fonts
  hyprpm update
  hyprpm add https://github.com/outfoxxed/hy3
  hyprpm update
  hyprpm enable hy3

fi
