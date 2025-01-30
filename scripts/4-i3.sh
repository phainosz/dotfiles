#!/usr/bin/env bash

APK=
DISTRO=$(hostnamectl | grep System | awk '{print $3}')

if [ "$DISTRO" == "Fedora" ]; then  
  APK=dnf
elif [ "$DISTRO" == "Ubuntu" ]; then
  APK=apt
else
  echo "Unsupported distribution: $DISTRO"
  exit 1
fi

sudo "$APK" install i3 i3status dmenu nemo kitty lxappearance arc-theme feh qt5ct -y

# remove existing i3 config if it exists
I3_CONFIG="$HOME/.config/i3"
if [ -e "$I3_CONFIG" ]; then
  echo "Removing existing i3 config..."
  sudo rm -rf "$I3_CONFIG"
fi

#create a symlink with i3 from dotfiles git project to .config
cd ../i3/
ln -s $(pwd) ~/.config/i3
