#!/bin/bash

set -euo pipefail

# prepare
sudo apt update
sudo apt install apt-transport-https curl wget gpg

# utilities
sudo apt update
sudo apt install exa ripgrep jq hexyl tmux cmake hexedit htop
# bat and fd
mkdir "$HOME/.local/bin"
sudo apt install bat fd-find
ln -s /usr/bin/batcat "$HOME/.local/bin/bat"
ln -s /usr/bin/fdfind "$HOME/.local/bin/fd"
# fzf, https://github.com/junegunn/fzf#installation
git clone --depth 1 https://github.com/junegunn/fzf.git "${XDG_DATA_HOME:-$HOME/.local/share}/fzf"
"${XDG_DATA_HOME:-$HOME/.local/share}/fzf/install" --xdg --no-bash --no-fish
# git-secret, https://git-secret.io/installation
wget -O- https://gitsecret.jfrog.io/artifactory/api/gpg/key/public | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/git-secret.gpg
sudo sh -c "echo 'deb https://gitsecret.jfrog.io/artifactory/git-secret-deb git-secret main' > /etc/apt/sources.list.d/git-secret.list"
sudo apt update
sudo apt install git-secret
# git-delta

# system, devops
sudo apt install docker.io docker-compose
# aws
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
sudo apt install amazon-ecr-credential-helper
# terraform
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform

# code, https://code.visualstudio.com/docs/setup/linux
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
printf 'Package: code\nPin: origin "packages.microsoft.com"\nPin-Priority: 9999\n' | sudo tee /etc/apt/preferences.d/code
sudo apt update
sudo apt install code

# spotify, https://www.spotify.com/us/download/linux
curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt install spotify-client

# flatpak
flatpak install flathub com.brave.Browser
flatpak install flathub io.dbeaver.DBeaverCommunity
flatpak install flathub com.github.wwmm.easyeffects
flatpak install flathub org.videolan.VLC
flatpak install flathub io.github.seadve.Kooha

# platform sepcific
# sudo apt install gnome-tweaks
# sudo apt install powertop
# sudo apt install fprintd libpam-fprintd
# sudo apt install intel-media-va-driver-non-free
# sudo apt install intel-gpu-tools
