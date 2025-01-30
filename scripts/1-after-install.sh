#!/usr/bin/env bash

DISTRO=$(hostnamectl | grep System | awk '{print $3}')
APK=

function install_fedora() {  
  sudo dnf update -y
}

function install_ubuntu() {
  sudo apt update -y && sudo apt upgrade -y

  sudo snap remove snap-store -y

  sudo apt install gnome-software gnome-software-plugin-flatpak -y

  sudo apt remove gnome-software-plugin-snap -y

  sudo snap remove firefox -y
}

function install_flatpak() {
  sudo "$APK" install flatpak -y
  flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
}

function configure_fedora() {
  #install free and nonfree repositories
  sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
}

if [ "$DISTRO" == "Fedora" ]; then
  APK=dnf
  install_fedora
  install_flatpak
  configure_fedora
elif [ "$DISTRO" == "Ubuntu" ]; then
  APF=apt
  install_ubuntu
  install_flatpak
else
  echo "Unsupported distribution: $DISTRO"
  exit 1
fi

sudo sh -c 'echo "set completion-ignore-case on" >> /etc/inputrc'
