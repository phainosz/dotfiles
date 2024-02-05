#!/usr/bin/env bash

APK=
DISTRO=$(hostnamectl | grep System | awk '{print $3}')

if [ "$DISTRO" == "Fedora" ]; then  
  APK=dnf
elif [ "$DISTRO" == "Ubuntu" ]; then
  APK=apt
fi

sudo "$APK" install i3 i3status dmenu nemo kitty lxappearance arc-theme feh qt5ct

sudo rm -rf ~/.config/i3

#create a symlink with i3 from dotfiles git project to .config
cd ../i3/
ln -s $(pwd) ~/.config/i3
