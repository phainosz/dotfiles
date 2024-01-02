#!/usr/bin/env bash

sudo rm -rf ~/.local/share/nvim
sudo rm -rf ~/.local/state/nvim
sudo rm -rf ~/.config/nvim/

# quickstart for packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\ ~/.local/share/nvim/site/pack/packer/start/packer.nvim
