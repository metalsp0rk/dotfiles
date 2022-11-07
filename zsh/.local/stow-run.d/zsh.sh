#!/usr/bin/env bash

if [ -d "$HOME/.oh-my-zsh/.git" ]; then
  echo "already installed oh-my-zsh"
  pushd ~/.oh-my-zsh
  git pull
  popd
else
  git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh -b master
fi

sudo pacman -S fzf python-virtualenvwrapper --needed
