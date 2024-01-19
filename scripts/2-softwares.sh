#!/usr/bin/env bash

DISTRO=$(hostnamectl | grep System | awk '{print $3}')

function install_fedora() {  
  sudo dnf update -y

  #chrome
  sudo dnf install fedora-workstation-repositories
  sudo dnf config-manager --set-enabled google-chrome
  sudo dnf install google-chrome-stable

  #vscode
  sudo dnf install code

  #qbitTorrent
  sudo dnf install qbittorrent

  #git
  sudo dnf install git-all

  #neovim
  sudo dnf install neovim

  #vlc
  sudo dnf install vlc

  #flameshot
  sudo dnf install flameshot
}

function install_ubuntu() {
  sudo apt update -y && sudo apt upgrade -y
}

function install_jebrains_toolbox() {
  wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-2.1.0.18144.tar.gz
  ls | grep tar.gz > file
  TAR=$(awk '{print $0}' file)
  rm file
  echo $TAR
  sudo tar -xzf $TAR
  rm $TAR
  JETBRAINS_FOLDER=$(find . -type d -name 'jetbrains*')
  # ${$JETBRAINS_FOLDER}\/jetbrains-toolbox
  #test another way
  ${$JETBRAINS_FOLDER}/${jetbrains-toolbox}
}

function install_flatpak() {
  #insomnia
  flatpak install flathub rest.insomnia.Insomnia

  #spotify
  flatpak install flathub com.spotify.Client

  #firefox
  flatpak install flathub org.mozilla.firefox
}

function install_sdkman() {
  #sdkman
  curl -s "https://get.sdkman.io" | bash
  source "$HOME/.sdkman/bin/sdkman-init.sh"
}

if [ "$DISTRO" == "Fedora" ]; then  
  install_fedora
elif [ "$DISTRO" == "Ubuntu" ]; then
  install_ubuntu
fi

install_flatpak
install_jebrains_toolbox
install_sdkman
