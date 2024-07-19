#!/usr/bin/env bash

unameout="$(uname -s)"
case "${unameout}" in
  Linux*)	machine=Linux;;
  Darwin*)	machine=Mac;;
  CYGWIN*)	machine=Cygwin;;
  MINGW*)	machine=MinGw;;
  *)		machine="UNKNOWN:${unameout}";;
esac

if [ "${machine}" == "Linux" ]; then
  yay -S --needed --noconfirm neovim yarn nodejs rubygems perl npm zip unzip lua-language-server
fi

if [ "${machine}" == "Mac" ]; then
brew install neovim terraform-ls lua-language-server golang rust python@3.10 ripgrep python-pynvim fd yarn
fi
yarn install -g neovim
gem install neovim
cpan install neovim

# install-helm-ls

if [ "${machine}" == "Mac" ]; then
curl -L https://github.com/mrjosh/helm-ls/releases/download/v0.0.3/helm_ls_darwin_arm64 -o $HOME/.local/bin/helm-ls
chmod +x $HOME/.local/bin/helm-ls
fi

if [ "${machine}" == "Linux" ]; then
  yay -S helm-ls --noconfirm --needed
fi
curl -L https://github.com/mrjosh/helm-ls/releases/download/v0.0.3/helm_ls_darwin_arm64 -o $HOME/.local/bin/helm-ls
