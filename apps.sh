#!/bin/bash

set -euo pipefail

# prepare
sudo apt update && sudo apt install apt-transport-https curl wget gpg ca-certificates

# basics
sudo apt update && sudo apt install jq tmux cmake hexedit htop
# platform sepcific
# sudo apt install gnome-tweaks
# sudo apt install powertop
# sudo apt install fprintd libpam-fprintd
# sudo apt install intel-media-va-driver-non-free
# sudo apt install intel-gpu-tools

mkdir -p "$HOME/.local/bin"
# cli, install with dra
curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/devmatteini/dra/refs/heads/main/install.sh | bash -s -- --to ~/.local/bin
dra download -i -s "bat-v{tag}-x86_64-unknown-linux-gnu.tar.gz" -o ~/.local/bin/ sharkdp/bat
dra download -i -s "delta-{tag}-x86_64-unknown-linux-gnu.tar.gz" -o ~/.local/bin/ dandavison/delta
dra download -i -s "eza_x86_64-unknown-linux-gnu.tar.gz" -o ~/.local/bin/ eza-community/eza
dra download -i -s "fd-v{tag}-x86_64-unknown-linux-gnu.tar.gz" -o ~/.local/bin/ sharkdp/fd
dra download -i -s "hexyl-v{tag}-x86_64-unknown-linux-gnu.tar.gz" -o ~/.local/bin/ sharkdp/hexyl
dra download -i -s "ripgrep-{tag}-x86_64-unknown-linux-musl.tar.gz" -o ~/.local/bin/ BurntSushi/ripgrep
dra download -i -s "sops-v{tag}.linux.amd64" -o ~/.local/bin/ getsops/sops
# vim
dra download -i -s "nvim-linux-x86_64.appimage" -o ~/.local/bin/ neovim/neovim
# fzf, https://github.com/junegunn/fzf#installation
git clone --depth 1 https://github.com/junegunn/fzf.git "${XDG_DATA_HOME:-$HOME/.local/share}/fzf"
"${XDG_DATA_HOME:-$HOME/.local/share}/fzf/install" --xdg --no-bash --no-fish

# toolchain
# bun
curl -fsSL https://bun.com/install | bash
# uv
curl -LsSf https://astral.sh/uv/install.sh | sh
# rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# kubectl helm go

# docker, https://docs.docker.com/engine/install/ubuntu/
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update && sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# aws
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install --bin-dir ~/.local/bin --install-dir ~/.local/aws-cli && rm -rf awscliv2.zip ./aws
sudo apt install amazon-ecr-credential-helper

# terraform, https://developer.hashicorp.com/terraform/install#linux
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform

# code, https://code.visualstudio.com/docs/setup/linux

# flatpak
flatpak install flathub io.github.ungoogled_software.ungoogled_chromium
flatpak install flathub com.brave.Browser
flatpak install flathub io.dbeaver.DBeaverCommunity
flatpak install flathub com.github.wwmm.easyeffects
flatpak install flathub org.videolan.VLC
flatpak install flathub me.iepure.devtoolbox
flatpak install flathub com.usebruno.Bruno
flatpak install flathub it.mijorus.gearlever
