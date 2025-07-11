# Add the official Docker repo
sudo dnf -y install dnf-plugins-core
sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

# Install Docker engine and standard plugins
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo groupadd docker

# Give this user privileged Docker access
sudo usermod -aG docker $USER

# Limit log size to avoid running out of disk
echo '{"log-driver":"json-file","log-opts":{"max-size":"10m","max-file":"5"}}' | sudo tee /etc/docker/daemon.json
