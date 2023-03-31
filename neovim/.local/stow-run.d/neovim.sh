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
  sudo pacman -S nodejs yarn python-pynvim --needed
fi
if [ "${machine}" == "Mac" ]; then
  brew install nodejs yarn python-pynvim ripgrep fd
  yarn install -g neovim
  gem install neovim
  cpan install neovim
fi


nvim --headless +PlugInstall +qa
nvim --headless +PlugInstall +qa
