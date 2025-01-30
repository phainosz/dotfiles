#!/usr/bin/env bash

APK=
DISTRO=$(hostnamectl | grep System | awk '{print $3}')
CURRENT_FOLDER=$(pwd)

function remove_neovim() {
  # paths to remove
  NVIM_PATHS=(
    "$HOME/.local/share/nvim"
    "$HOME/.local/state/nvim"
    "/usr/local/bin/nvim"
    "$HOME/.config/nvim"
  )

  # remove existing Neovim files only if they exist
  for path in "${NVIM_PATHS[@]}"; do
    if [ -e "$path" ]; then
      echo "Removing: $path"
      sudo rm -rf "$path"
    fi
  done
}

function install_neovim_prerequisistes_ubuntu() {
  sudo apt install ninja-build gettext cmake unzip curl build-essential

  #fd to use with telescope
  sudo apt install ripgrep -y
  #fd to use with telescope
  sudo apt install fd-find -y
}

function install_neovim_prerequisistes_fedora() {
  sudo dnf -y install ninja-build cmake gcc make unzip gettext curl glibc-gconv-extra

  #fd to use with telescope
  sudo dnf install ripgrep -y
  #fd to use with telescope
  sudo dnf install fd-find -y
}

function install_neovim() {  
  NEOVIM_SRC="$HOME/Documents/dev/tools/neovim"

  if [ -d "$NEOVIM_SRC" ]; then
    echo "Removing existing Neovim source directory"
    sudo rm -rf "$NEOVIM_SRC"
  fi

  echo "Cloning Neovim from source"
  git clone https://github.com/neovim/neovim "$NEOVIM_SRC"
  cd "$NEOVIM_SRC"
  git checkout stable
  make CMAKE_BUILD_TYPE=Release
  sudo make install

  echo "Moving back to script folder: $CURRENT_FOLDER"
  cd "$CURRENT_FOLDER"

  #echo "Removing neovim source cloned"
  #sudo rm -rf $HOME/Documents/neovim
  #sudo cmake --build build/ --target uninstall
}

if [ "$DISTRO" == "Fedora" ]; then  
  APK=dnf
  install_neovim_prerequisistes_fedora
elif [ "$DISTRO" == "Ubuntu" ]; then
  APK=apt
  install_neovim_prerequisistes_ubuntu
else
  echo "Unsupported distribution: $DISTRO"
  exit 1
fi

remove_neovim
install_neovim

#create a symlink with nvim from dotfiles git project to .config
cd ../nvim/
ln -s $(pwd) ~/.config/nvim
