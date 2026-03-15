#!/bin/bash

set -euo pipefail

if ! command -v brew &>/dev/null ; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install \
       bat \
       delta \
       duckdb \
       eza \
       fd \
       ffmpeg \
       fzf \
       gh \
       git \
       hexyl \
       jq \
       neovim \
       pfetch \
       presenterm \
       ripgrep \
       sops \
       tmux \
       wget \
       zellij

# vim-plug
# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
