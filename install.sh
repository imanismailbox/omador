# Exit immediately if a command exits with a non-zero status
set -e

# Give people a chance to retry running the installation
trap 'echo "Omador installation failed! You can retry by running: source ~/.local/share/omador/install.sh"' ERR

# Check the distribution name and version and abort if incompatible
source ~/.local/share/omador/install/check-version.sh

# Ask for app choices
echo "Get ready to make a few choices..."
source ~/.local/share/omador/install/terminal/required/app-gum.sh >/dev/null
source ~/.local/share/omador/install/first-run-choices.sh
source ~/.local/share/omador/install/identification.sh

# Desktop software and tweaks will only be installed if we're running Gnome
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  # Ensure computer doesn't go to sleep or lock while installing
  gsettings set org.gnome.desktop.screensaver lock-enabled false
  gsettings set org.gnome.desktop.session idle-delay 0

  echo "Installing terminal and desktop tools..."

  # Install terminal tools
  source ~/.local/share/omador/install/terminal.sh

  # Install desktop tools and tweaks
  source ~/.local/share/omador/install/desktop.sh

  # Revert to normal idle and lock settings
  gsettings set org.gnome.desktop.screensaver lock-enabled true
  gsettings set org.gnome.desktop.session idle-delay 300
else
  echo "Only installing terminal tools..."
  source ~/.local/share/omador/install/terminal.sh
fi
