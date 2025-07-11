#!/bin/bash

# --- Persiapan Awal ---
echo "Memulai instalasi otomatis Zsh, Oh My Zsh, dan pluginnya..."

# Deteksi sistem operasi
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
else
    echo "Tidak dapat mendeteksi OS. Skrip ini mungkin tidak bekerja dengan benar."
    exit 1
fi

# Fungsi untuk menginstal paket
install_package() {
    PACKAGE=$1
    if command -v $PACKAGE &> /dev/null; then
        echo "$PACKAGE sudah terinstal. Melewati instalasi."
    else
        echo "Menginstal $PACKAGE..."
        if [ "$OS" == "ubuntu" ] || [ "$OS" == "debian" ]; then
            sudo apt update -y
            sudo apt install -y $PACKAGE
        elif [ "$OS" == "fedora" ]; then
            sudo dnf install -y $PACKAGE
        else
            echo "OS tidak didukung untuk instalasi otomatis $PACKAGE."
            exit 1
        fi
    fi
}

# --- Instalasi Zsh ---
install_package zsh

# Set Zsh sebagai shell default jika belum
if [[ "$SHELL" != "/usr/bin/zsh" && "$SHELL" != "/bin/zsh" ]]; then
    echo "Mengatur Zsh sebagai shell default..."
    chsh -s $(which zsh)
    echo "PENTING: Harap logout dan login kembali agar perubahan shell diterapkan."
fi

# --- Instalasi Oh My Zsh ---
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Menginstal Oh My Zsh..."
    # Gunakan curl dengan opsi -sS (silent, show errors) dan tanpa -y karena installer tidak membutuhkannya
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Oh My Zsh sudah terinstal. Melewati instalasi."
fi

# --- Instalasi Plugin Zsh ---
echo "Menginstal plugin Zsh (zsh-autosuggestions, zsh-syntax-highlighting)..."

# zsh-autosuggestions
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
else
    echo "zsh-autosuggestions sudah ada. Melewati cloning."
fi

# zsh-syntax-highlighting
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
else
    echo "zsh-syntax-highlighting sudah ada. Melewati cloning."
fi

# Aktifkan plugin di .zshrc
echo "Mengaktifkan plugin di .zshrc..."
if ! grep -q "zsh-autosuggestions" "$HOME/.zshrc"; then
    sed -i 's/^plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' "$HOME/.zshrc"
else
    echo "Plugin sudah aktif di .zshrc."
fi

# --- Instalasi Starship ---
echo "Menginstal Starship (cross-shell prompt)..."
if ! command -v starship &> /dev/null; then
    curl -fsSL https://starship.rs/install.sh | sh -s -- -y
else
    echo "Starship sudah terinstal. Melewati instalasi."
fi

# Konfigurasi Starship di .zshrc
echo "Mengkonfigurasi Starship di .zshrc..."
if ! grep -q "eval \"$(starship init zsh)\"" "$HOME/.zshrc"; then
    echo '' >> "$HOME/.zshrc"
    echo '# Inisialisasi Starship' >> "$HOME/.zshrc"
    echo 'eval "$(starship init zsh)"' >> "$HOME/.zshrc"
else
    echo "Starship sudah dikonfigurasi di .zshrc."
fi

echo "Instalasi Zsh dan pluginnya selesai!"
echo "PENTING: Harap restart terminal Anda atau logout/login kembali agar semua perubahan diterapkan."