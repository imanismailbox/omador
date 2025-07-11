#!/bin/bash

if [ ! -f /etc/os-release ]; then
  echo "$(tput setaf 1)Error: Unable to determine OS. /etc/os-release file not found."
  echo "Installation stopped."
  exit 1
fi

. /etc/os-release

# Instal paket dasar untuk semua versi Fedora
sudo dnf install -y fzf ripgrep bat zoxide plocate httpd-tools fd-find tldr

if (( $(echo "$VERSION_ID >= 42" | bc -l) )); then
  cd /tmp
  wget -c https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-musl.tar.gz -O - | tar xz
  sudo chmod +x eza
  sudo chown root:root eza
  sudo mv eza /usr/local/bin/eza
  cd -
else
  sudo dnf install -y eza
fi