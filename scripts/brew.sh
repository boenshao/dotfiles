#!/bin/bash

set -euo pipefail

if ! command -v brew &>/dev/null ; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install \
      awscli \
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

brew install --cask \
      appcleaner \
      brave-browser \
      dbeaver-community \
      devtoys \
      ghostty \
      logi-options+ \
      raycast \
      reader \
      stats \
      visual-studio-code \
      vlc

brew install --cask \
      claude \
      claude-code \
      slack

brew install --cask nikitabobko/tap/aerospace
brew install --cask felixkratz/formulae/borders

# vim-plug
# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
