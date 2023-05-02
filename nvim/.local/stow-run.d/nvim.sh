#!/usr/bin/env bash

brew install neovim terraform-ls lua-language-server golang rust python@3.10 ripgrep python-pynvim fd yarn

yarn install -g neovim
gem install neovim
cpan install neovim


# Run PackerSync twice to ensure all plugins are installed
nvim --headless +PackerSync +qa
nvim --headless +PackerSync +qa
