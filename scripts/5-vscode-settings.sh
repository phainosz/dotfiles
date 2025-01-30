#!/usr/bin/env bash

FILES=(
  "$HOME/.config/Code/User/keybindings.json"
  "$HOME/.config/Code/User/settings.json"
)

# remove existing Neovim files and symlinks only if they exist
for file in "${FILES[@]}"; do
  # checks if it's a file or a symlink
  if [ -f "$file" ] || [ -L "$file" ]; then
    echo "Removing: $file"
    sudo rm -f "$file"
  fi
done

#create a symlink with vscode config from dotfiles git project to .config
cd ../vscode
ln -s $(pwd)/settings.json ~/.config/Code/User/settings.json
ln -s $(pwd)/keybindings.json ~/.config/Code/User/keybindings.json
