#!/usr/bin/env bash

sudo pacman -S --needed base-devel git
if command -v yay &> /dev/null; then
  echo "yay installed"
else
  mkdir -pv builds

  git clone https://aur.archlinux.org/yay.git builds/yay
  pushd builds/yay
  makepkg -si
  popd
  rm -rf builds
fi
