#!/usr/bin/env bash

sudo rm -rf ~/.config/zed/keymap.json
sudo rm -rf ~/.config/zed/settings.json

#create a symlink with zed config from dotfiles git project to .config
cd ../zed
ln -s $(pwd)/settings.json ~/.config/zed/settings.json
ln -s $(pwd)/keymap.json ~/.config/zed/keymap.json