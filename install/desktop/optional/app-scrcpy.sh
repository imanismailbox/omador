# Install dependencies
sudo dnf install -y ffmpeg SDL2 ad-tools wget \
  gcc git pkg-config meson ninja-build SDL2-devel \
  libavcodec-devel libavdevice-devel libavformat-devel libavutil-devel \
  libswresample-devel libusbx-devel

# Install latest Scrcpy straight from GitHub
cd /tmp
git clone https://github.com/Genymobile/scrcpy
cd scrcpy
./install_release.sh
cd ..
rm -rf scrcpy

cat <<EOF >~/.local/share/applications/Android.desktop
[Desktop Entry]
Version=1.0
Name=Android
Comment=Android Screen Mirroring
Exec=scrcpy -S
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/omador/applications/icons/Android.png
Categories=GTK;
StartupNotify=false
EOF
