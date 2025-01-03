#!/usr/bin/env bash

APK=
DISTRO=$(hostnamectl | grep System | awk '{print $3}')
CURRENT_FOLDER=`pwd`

function install_neovim_prerequisistes_ubuntu() {
  sudo apt-get install ninja-build gettext cmake unzip curl build-essential
}

function install_neovim_prerequisistes_fedora() {
  sudo dnf -y install ninja-build cmake gcc make unzip gettext curl glibc-gconv-extra
}

function install_neovim() {  
  #from source
  sudo rm -rf $HOME/Documents/dev/tools/neovim
  echo "Cloning from source"
  git clone https://github.com/neovim/neovim $HOME/Documents/dev/tools/neovim
  cd $HOME/Documents/dev/tools/neovim 
  git checkout stable
  make CMAKE_BUILD_TYPE=Release
  sudo make install

  #echo "Removing neovim source cloned"
  #sudo rm -rf $HOME/Documents/neovim
  #sudo cmake --build build/ --target uninstall

  #go back to script folder
  echo "Moving back to script folder $CURRENT_FOLDER"
  cd "$CURRENT_FOLDER"
}

if [ "$DISTRO" == "Fedora" ]; then  
  APK=dnf
  install_neovim_prerequisistes_fedora
elif [ "$DISTRO" == "Ubuntu" ]; then
  APK=apt
  install_neovim_prerequisistes_ubuntu
fi

sudo rm -rf ~/.local/share/nvim
sudo rm -rf ~/.local/state/nvim
sudo rm -rf /usr/local/bin/nvim
sudo rm -rf ~/.config/nvim

install_neovim

#fd to use with telescope
sudo "$APK" install fd-find -y

#ripgrep to use telescope
sudo "$APK" install ripgrep -y

#create a symlink with nvim from dotfiles git project to .config
cd ../nvim/
ln -s $(pwd) ~/.config/nvim

# quickstart for packer
# git clone --depth 1 https://github.com/wbthomason/packer.nvim\ ~/.local/share/nvim/site/pack/packer/start/packer.nvim
