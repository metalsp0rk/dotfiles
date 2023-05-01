#!/usr/bin/env bash

brew install tfenv nodejs npm 

echo "Installing global npm packages, may ask for sudo password..."
sudo npm install -g @terraform-visual/cli
