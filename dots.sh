#!/bin/bash

set -euo pipefail

# basic env
ln -snfv "${PWD}/home/.zshenv" "${HOME}/.zshenv"

# shellcheck disable=SC1091
source "${HOME}/.zshenv"

for d in config/*; do
    n=$(basename "${d}")
    ln -snfv "${PWD}/${d}" "${XDG_CONFIG_HOME}/${n}"
done

mkdir -p "${ZCACHE}"
mkdir -p "${ZDATA}"
