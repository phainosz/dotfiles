#!/usr/bin/env bash

# Check if the file exists before trying to remove it
if [ -f "$HOME/.ideavimrc" ] || [ -L "$HOME/.ideavimrc" ]; then
    sudo rm "$HOME/.ideavimrc"
fi

#create a symlink for .ideavimrc
cd ../
ln -s $(pwd)/.ideavimrc $HOME/.ideavimrc
