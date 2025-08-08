#!/usr/bin/env bash

# Define file paths
SETTINGS_FILE="$HOME/.config/zed/settings.json"
KEYMAP_FILE="$HOME/.config/zed/keymap.json"

# remove existing files or symlinks if they exist
[ -e "$SETTINGS_FILE" ] && echo "Removing existing settings.json" && sudo rm -f "$SETTINGS_FILE"
[ -e "$KEYMAP_FILE" ] && echo "Removing existing keymap.json" && sudo rm -f "$KEYMAP_FILE"

# create a symlink with zed config from dotfiles git project to .config
echo "Creating symlinks..."
cd ../zed
ln -s "$(pwd)/settings.json" "$SETTINGS_FILE"
ln -s "$(pwd)/keymap.json" "$KEYMAP_FILE"

echo "Symlink setup complete!"
