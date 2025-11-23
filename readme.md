# Dotfiles Configuration

This repository manages your development environment configurations using Ansible.
It sets up your workstation for Linux (Fedora/Ubuntu) and macOS.

All dotfiles and editor configurations are stored in a shared directory, so Linux and macOS share the same configuration.

## Requirements
- Ansible
- Linux or macOS system

## Installing Ansible

### Fedora
```
sudo dnf install ansible -y
```

### Ubuntu / Debian
```
sudo apt update && sudo apt install ansible -y
```

### macOS (homebrew)
```
brew install ansible
```


## Using this repo
```
git clone https://github.com/phainosz/dotfiles.git
cd dotfiles

ansible-playbook -i inventory/hosts.ini site.yml
```