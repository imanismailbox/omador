sudo dnf config-manager setopt docker-ce-stable.enabled=0
sudo dnf remove -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
