# Display system information in the terminal
sudo dnf install -y fastfetch

# Only attempt to set configuration if fastfetch is not already set
if [ ! -f "$HOME/.config/fastfetch/config.jsonc" ]; then
  # Use Omador fastfetch config
  mkdir -p ~/.config/fastfetch
  cp ~/.local/share/omador/configs/fastfetch.jsonc ~/.config/fastfetch/config.jsonc
fi
