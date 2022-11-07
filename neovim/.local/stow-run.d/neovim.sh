#!/usr/bin/env bash

sudo pacman -S nodejs yarn python-pynvim --needed

nvim --headless +PlugInstall +qa
nvim --headless +PlugInstall +qa
