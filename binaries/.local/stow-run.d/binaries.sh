#!/usr/bin/env bash

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac
if [ "${machine}" == "Linux" ]; then
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
fi
if [ "${machine}" == "Linux" ]; then
  echo "No Install needed"
fi

