#!/usr/bin/env bash

sudo rm $HOME/.ideavimrc

#create a symlink for .ideavimrc
cd ../
ln -s $(pwd)/.ideavimrc ~/.ideavimrc
