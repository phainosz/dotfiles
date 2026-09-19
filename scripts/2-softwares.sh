#!/usr/bin/env bash

DISTRO=$(hostnamectl | grep System | awk '{print $3}')

function install_fedora() {
  echo "Starting Fedora installation..."
  sudo dnf update -y

  #zed
  #curl -f https://zed.dev/install.sh | sh

  #qbitTorrent
  sudo dnf install qbittorrent -y

  #git
  sudo dnf install git-all -y

  #vlc
  sudo dnf install vlc -y
  sudo dnf swap ffmpeg-free ffmpeg --allowerasing -y

  #zsh
  sudo dnf install zsh
  #ohmyzsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  #change to zsh
  chsh -s $(which zsh)
}

function install_ubuntu() {
  echo "Starting Ubuntu installation..."
  sudo apt update -y
  sudo apt upgrade -y

  # Install core software packages
  # git-all equivalent is usually git, we add common tools like curl for Zsh setup
  sudo apt install -y qbittorrent git vlc zsh curl

  # Zed installer (OS-agnostic curl script)
  #curl -f https://zed.dev/install.sh | sh

  # Oh My Zsh setup
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  # Change to zsh
  chsh -s $(which zsh)
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
  #spotify
  flatpak install flathub com.spotify.Client -y
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
#install_jebrains_toolbox
install_sdkman
configure_git
configure_ssh
