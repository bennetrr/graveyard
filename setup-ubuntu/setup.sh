#! /bin/bash
set -e
export DEBIAN_FRONTEND=noninteractive

# shellcheck source=./logging.sh
source ./logging.sh

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
  warning "This script must be run as root!"
  exit 1
fi

#region Variables
OS_DISTRIBUTOR=$(lsb_release -si)
OS_DISTRIBUTOR=${OS_DISTRIBUTOR,,}
OS_CODENAME=$(lsb_release -sc)
OS_CODENAME=${OS_CODENAME,,}
OS_ARCHITECTURE=$(dpkg --print-architecture)
#endregion

#region APT
info "Updating system"
apt update
apt dist-upgrade -y

info "Installing dependencies"
info "Installing htop"
info "Installing git"
info "Installing zsh"
info "Installing unattended-upgrades"
apt install -y apt-transport-https ca-certificates curl debian-archive-keyring debian-keyring git gnupg htop lsb-release unzip zip zsh unattended-upgrades
#endregion

#region GitHub CLI
info "Installing GitHub CLI"
wget -O- https://cli.github.com/packages/githubcli-archive-keyring.gpg | gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$OS_ARCHITECTURE signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list
apt update
apt install -y gh
#endregion

#region Docker
info "Removing old Docker versions"
set +e
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do apt purge $pkg; done
rm -vdrf /var/lib/docker
rm -vdrf /var/lib/containerd
set -e

info "Installing Docker"
wget -O- "https://download.docker.com/linux/$OS_DISTRIBUTOR/gpg" | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$OS_ARCHITECTURE signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/$OS_DISTRIBUTOR $OS_CODENAME stable" | tee /etc/apt/sources.list.d/docker.list >/dev/null
apt update
apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

info "Installing DOPS"
wget "https://github.com/Mikescher/better-docker-ps/releases/latest/download/dops_linux-$OS_ARCHITECTURE-static" -O "/usr/local/bin/dops" 
chmod +x "/usr/local/bin/dops"
#endregion

#region ZSH
info "Installing OhMyZSH"
wget -O- "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh" | bash

info "Installing Pygments"
apt install -y python3-pygments

info "Installing zsh plugins"
git clone --depth=1 "https://github.com/romkatv/powerlevel10k.git" ~/.oh-my-zsh/custom/themes/powerlevel10k
git clone "https://github.com/zsh-users/zsh-autosuggestions" ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone "https://github.com/zsh-users/zsh-syntax-highlighting.git" ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

info "Configuring zsh"
cp -v .zshrc .p10k.zsh ~

info "Setting default shell do zsh"
chsh -s /bin/zsh
#endregion

finished
