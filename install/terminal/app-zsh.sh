#!/bin/bash

install_package() {
    PACKAGE=$1
    if command -v "$PACKAGE" &> /dev/null; then
        :
    else
        if command -v dnf &> /dev/null; then
            sudo dnf install -y "$PACKAGE"
        elif command -v apt &> /dev/null; then
            sudo apt update -y
            sudo apt install -y "$PACKAGE"
        else
            exit 1
        fi
    fi
}

install_package zsh

if [[ "$SHELL" != "/usr/bin/zsh" && "$SHELL" != "/bin/zsh" ]]; then
    chsh -s "$(which zsh)"
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

if ! grep -q "zsh-autosuggestions" "$HOME/.zshrc"; then
    sed -i 's/^plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' "$HOME/.zshrc"
fi

if ! command -v starship &> /dev/null; then
    curl -fsSL https://starship.rs/install.sh | sh -s -- -y
fi

if ! grep -q "eval \"$(starship init zsh)\"" "$HOME/.zshrc"; then
    echo '' >> "$HOME/.zshrc"
    echo '# Inisialisasi Starship' >> "$HOME/.zshrc"
    echo 'eval "$(starship init zsh)"' >> "$HOME/.zshrc"
fi