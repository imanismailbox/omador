#!/bin/bash

# Instal paket dasar untuk semua versi Fedora
sudo dnf install -y fzf ripgrep bat zoxide plocate httpd-tools fd-find tldr

cd /tmp
wget -c https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-musl.tar.gz -O - | tar xz
sudo chmod +x eza
sudo chown root:root eza
sudo mv eza /usr/local/bin/eza
cd -