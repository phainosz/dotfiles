#!/usr/bin/env bash

sudo rm -rf ~/.config/Code/User/keybindings.json
sudo rm -rf ~/.config/Code/User/settings.json


#create a symlink with vscode config from dotfiles git project to .config
cd ../vscode
ln -s $(pwd)/settings.json ~/.config/Code/User/settings.json
ln -s $(pwd)/keybindings.json ~/.config/Code/User/keybindings.json
