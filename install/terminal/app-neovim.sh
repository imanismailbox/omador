# Install luarocks and tree-sitter-cli to resolve lazyvim :checkhealth warnings
sudo dnf install -y neovim python3-neovim luarocks tree-sitter-cli

# Only attempt to set configuration if Neovim has never been run
if [ ! -d "$HOME/.config/nvim" ]; then
  # Use LazyVim
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  # Remove the .git folder, so you can add it to your own repo later
  rm -rf ~/.config/nvim/.git

  # Make everything match the terminal transparency
  mkdir -p ~/.config/nvim/plugin/after
  cp ~/.local/share/omador/configs/neovim/transparency.lua ~/.config/nvim/plugin/after/

  # Default to Tokyo Night theme
  cp ~/.local/share/omador/themes/tokyo-night/neovim.lua ~/.config/nvim/lua/plugins/theme.lua

  # Turn off animated scrolling
  cp ~/.local/share/omador/configs/neovim/snacks-animated-scrolling-off.lua ~/.config/nvim/lua/plugins/

  # Turn off relative line numbers
  echo "vim.opt.relativenumber = false" >>~/.config/nvim/lua/config/options.lua
fi

# Replace desktop launcher with one running inside Alacritty
if [[ -d ~/.local/share/applications ]]; then
  sudo rm -rf /usr/share/applications/nvim.desktop
  source ~/.local/share/omador/applications/Neovim.sh
fi
