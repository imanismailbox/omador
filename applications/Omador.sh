cat <<EOF >~/.local/share/applications/Omador.desktop
[Desktop Entry]
Version=1.0
Name=Omador
Comment=Omador Controls
Exec=alacritty --config-file /home/$USER/.config/alacritty/pane.toml --class=Omador --title=Omador -e omador
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/omador/applications/icons/Omador.png
Categories=GTK;
StartupNotify=false
EOF
