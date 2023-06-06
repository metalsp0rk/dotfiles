#!/usr/bin/env bash

brew install neovim terraform-ls lua-language-server golang rust python@3.10 ripgrep python-pynvim fd yarn

yarn install -g neovim
gem install neovim
cpan install neovim

# install-helm-ls

curl -L https://github.com/mrjosh/helm-ls/releases/download/v0.0.3/helm_ls_darwin_arm64 -o $HOME/.local/bin/helm-ls
chmod +x $HOME/.local/bin/helm-ls

# Run PackerSync twice to ensure all plugins are installed
nvim --headless +PackerSync +qa
nvim --headless +PackerSync +qa
