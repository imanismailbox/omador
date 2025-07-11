# This script installs btop, a resource monitor that shows usage and stats for processor, memory, disks, network and processes.
sudo dnf install -y btop

# Use Omador btop config
mkdir -p ~/.config/btop/themes
cp ~/.local/share/omador/configs/btop.conf ~/.config/btop/btop.conf
cp ~/.local/share/omador/themes/tokyo-night/btop.theme ~/.config/btop/themes/tokyo-night.theme

