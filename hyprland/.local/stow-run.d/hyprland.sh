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

  yay --noconfirm --needed -S noto-fonts-emoji waybar wttrbar light wlsunset kanshi wmenu swww
  yay -S --noconfirm --needed ttf-sourcecodepro-nerd
  yay -S --noconfirm --needed newaita-icons-git
  yay -S --noconfirm --needed ttf-md-fonts-git
  yay -S --noconfirm --needed ttf-font-awesome
  yay -S --noconfirm --needed awesome-terminal-fonts
  hyprpm update
  hyprpm add https://github.com/outfoxxed/hy3
  hyprpm update
  hyprpm enable hy3

fi
