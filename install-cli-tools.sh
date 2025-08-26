#!/bin/bash

set -euo pipefail

# user bin
mkdir -p "$HOME/.local/bin"

# prepare
sudo apt update && sudo apt install apt-transport-https curl wget gpg ca-certificates

# basics
sudo apt update && sudo apt install jq tmux cmake hexedit htop
# dra
curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/devmatteini/dra/refs/heads/main/install.sh | bash -s -- --to ~/.local/bin
# bat
dra download -i -s "bat-v{tag}-x86_64-unknown-linux-gnu.tar.gz" -o ~/.local/bin/ sharkdp/bat
# delta
dra download -i -s "delta-{tag}-x86_64-unknown-linux-gnu.tar.gz" -o ~/.local/bin/ dandavison/delta
# eza
dra download -i -s "eza_x86_64-unknown-linux-gnu.tar.gz" -o ~/.local/bin/ eza-community/eza
# fd
dra download -i -s "fd-v{tag}-x86_64-unknown-linux-gnu.tar.gz" -o ~/.local/bin/ sharkdp/fd
# hexyl
dra download -i -s "hexyl-v{tag}-x86_64-unknown-linux-gnu.tar.gz" -o ~/.local/bin/ sharkdp/hexyl
# ripgrep
dra download -i -s "ripgrep-{tag}-x86_64-unknown-linux-musl.tar.gz" -o ~/.local/bin/ BurntSushi/ripgrep
# sops
dra download -i -s "sops-v{tag}.linux.amd64" -o ~/.local/bin/ getsops/sops
# vim
dra download -i -s "nvim-linux-x86_64.appimage" -o ~/.local/bin/ neovim/neovim
# fzf, https://github.com/junegunn/fzf#installation
git clone --depth 1 https://github.com/junegunn/fzf.git "${XDG_DATA_HOME:-$HOME/.local/share}/fzf"
"${XDG_DATA_HOME:-$HOME/.local/share}/fzf/install" --xdg --no-bash --no-fish
# kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
mv ./kubectl ~/.local/bin/kubectl
# TODO: helm