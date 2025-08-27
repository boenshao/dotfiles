#!/bin/bash

set -euo pipefail

# user bin
mkdir -p "$HOME/.local/bin"

# prepare
sudo apt update
sudo apt install apt-transport-https curl wget gpg ca-certificates

# bun
curl -fsSL https://bun.com/install | bash
# uv
curl -LsSf https://astral.sh/uv/install.sh | sh
# rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# go
wget -O - https://go.dev/dl/go1.20.5.linux-amd64.tar.gz | tar -xzf - -C ~/.local