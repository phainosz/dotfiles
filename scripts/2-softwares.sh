#!/usr/bin/env bash

DISTRO=$(hostnamectl | grep System | awk '{print $3}')

function install_fedora() {
  sudo dnf update -y

  #chrome
  sudo dnf install fedora-workstation-repositories -y
  sudo dnf config-manager --set-enabled google-chrome -y
  sudo dnf install google-chrome-stable -y

  #vscode
  sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
  sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
  sudo dnf check-update -y
  sudo dnf install code -y

  #zed
  curl -f https://zed.dev/install.sh | sh

  #qbitTorrent
  sudo dnf install qbittorrent -y

  #git
  sudo dnf install git-all -y

  #vlc
  sudo dnf install vlc -y
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
  #flatpak install flathub rest.insomnia.Insomnia -y

  #spotify
  flatpak install flathub com.spotify.Client -y

  #firefox
  flatpak install flathub org.mozilla.firefox -y
}

function install_sdkman() {
  #sdkman
  curl -s "https://get.sdkman.io" | bash
  source "$HOME/.sdkman/bin/sdkman-init.sh"
}

function configure_git() {
  echo "Enter your name"
  read GIT_NAME

  echo "Enter your git email"
  read GIT_EMAIL

  git config --global user.name "$GIT_NAME"
  git config --global user.email "$GIT_EMAIL"
}

function configure_ssh() {
  ssh-keygen -t ed25519 -C "$GIT_EMAIL"
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_ed25519
}

if [ "$DISTRO" == "Fedora" ]; then
  install_fedora
elif [ "$DISTRO" == "Ubuntu" ]; then
  install_ubuntu
else
  echo "Unsupported distribution: $DISTRO"
  exit 1
fi

install_flatpak
#disabled jebrains toolbox install
#install_jebrains_toolbox
install_sdkman
configure_git
configure_ssh
