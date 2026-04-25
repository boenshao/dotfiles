#!/bin/bash

set -euo pipefail

if ! command -v brew &>/dev/null ; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew bundle install

# TODO: uv bun rustup ghcup opam nvm