#!/usr/bin/env bash

APK=
DISTRO=$(hostnamectl | grep System | awk '{print $3}')

if [ "$DISTRO" == "Fedora" ]; then  
  APK=dnf
elif [ "$DISTRO" == "Ubuntu" ]; then
  APK=apt
fi

sudo rm -rf ~/.local/share/nvim
sudo rm -rf ~/.local/state/nvim
sudo rm -rf ~/.config/nvim/

#fd to use with telescope
sudo "$APK" install fd-find

#ripgrep to use telescope
sudo "$APK" install ripgrep

# quickstart for packer
# git clone --depth 1 https://github.com/wbthomason/packer.nvim\ ~/.local/share/nvim/site/pack/packer/start/packer.nvim
