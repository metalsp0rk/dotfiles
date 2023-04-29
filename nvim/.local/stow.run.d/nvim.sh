#!/usr/bin/env bash
# Install plugins
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
  brew install neovim nodejs yarn python-pynvim ripgrep fd
  yarn install -g neovim
  gem install neovim
  cpan install neovim
fi

nvim --headless +PackerSync +qa
nvim --headless +PackerSync +qa
