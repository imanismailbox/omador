# Gum is used for the Omador commands for tailoring Omador after the initial install
echo '[charm]
name=Charm
baseurl=https://repo.charm.sh/yum/
enabled=1
gpgcheck=1
gpgkey=https://repo.charm.sh/yum/gpg.key' | sudo tee /etc/yum.repos.d/charm.repo
sudo rpm --import https://repo.charm.sh/yum/gpg.key

# yum
sudo yum install gum