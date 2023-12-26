#!/usr/bin/env bash

DISTRO=$(hostnamectl | grep System | awk '{print $3}')

function install_fedora() {  
  sudo dnf update -y

}

function install_ubuntu() {
  sudo apt update -y && sudo apt upgrade -y

  sudo apt install flatpak
}

function install_flatpak() {
  flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
}

function configure_fedora() {
  #install free and nonfree repositories
  sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
}

if [ "$DISTRO" == "Fedora" ]; then  
  install_fedora
  configure_fedora
  install_flatpak
elif [ "$DISTRO" == "Ubuntu" ]; then
  install_ubuntu
  install_flatpak
fi