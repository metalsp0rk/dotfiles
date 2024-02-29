#!/usr/bin/env bash

if [ -d "$HOME/.oh-my-zsh/.git" ]; then
  echo "already installed oh-my-zsh"
  pushd ~/.oh-my-zsh
  git pull
  popd
else
  git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh -b master
fi

unameout="$(uname -s)"

case "${unameout}" in
  Linux*)	machine=Linux;;
  Darwin*)	machine=Mac;;
  CYGWIN*)	machine=Cygwin;;
  MINGW*)	machine=MinGw;;
  *)		machine="UNKNOWN:${unameout}";;
esac
if [ "${machine}" == "Linux" ]; then
  sudo pacman -S fzf python-virtualenvwrapper --needed
  sudo pacman -S xdotool xclip --noconfirm --needed
  if ! command -v yay &> /dev/null
  then
    git clone https://aur.archlinux.org/yay.git ~/.yay-install
    pushd ~/.yay-install
    makepkg -si
    popd
  fi
fi
if [ "${machine}" == "Mac" ]; then
  brew install fzf pyenv-virtualenvwrapper nodejs npm
  sudo npm install -g @terraform-visual/cli
fi
