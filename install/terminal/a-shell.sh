# Configure the bash shell using Omador defaults
[ -f "~/.bashrc" ] && mv ~/.bashrc ~/.bashrc.bak
cp ~/.local/share/omador/configs/bashrc ~/.bashrc

# Load the PATH for use later in the installers
source ~/.local/share/omador/defaults/bash/shell

# Install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  rm -rf ~/.oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Configure the zsh shell using omador defaults
echo 'source ~/.local/share/omador/defaults/zsh/rc' >> ~/.zshrc

export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"

# Load the PATH for use later in the installers
if [ -f ~/.local/share/omador/defaults/zsh/shell ]; then
  source ~/.local/share/omador/defaults/zsh/shell
fi

[ -f "~/.inputrc" ] && mv ~/.inputrc ~/.inputrc.bak
# Configure the inputrc using Omador defaults
cp ~/.local/share/omador/configs/inputrc ~/.inputrc
