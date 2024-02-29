#!/usr/bin/env bash

unameout="$(uname -s)"

case "${unameout}" in
  Linux*)	machine=Linux;;
  Darwin*)	machine=Mac;;
  CYGWIN*)	machine=Cygwin;;
  MINGW*)	machine=MinGw;;
  *)		machine="UNKNOWN:${unameout}";;
esac
if [ "${machine}" == "Mac" ]; then
  brew install tmux fzf
fi

if [ "${machine}" == "Linux" ]; then
  sudo pacman -S tmux fzf --needed --noconfirm
fi
