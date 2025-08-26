#!/usr/bin/env bash

unameout="$(uname -s)"

case "${unameout}" in
Linux*) machine=Linux ;;
Darwin*) machine=Mac ;;
CYGWIN*) machine=Cygwin ;;
MINGW*) machine=MinGw ;;
*) machine="UNKNOWN:${unameout}" ;;
esac
if [ "${machine}" == "Linux" ]; then
  pip install "beets[bpd]"
  mkdir ~/.local/share/mpd/ || true
fi
