export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZCACHE="$XDG_CACHE_HOME/zsh"
export ZDATA="$XDG_DATA_HOME/zsh"

# user bin
export PATH="$HOME/.local/bin:$PATH"

# golang
[ -d "$HOME/.local/go/bin" ] && export PATH="$PATH:$HOME/.local/go/bin"
if command -v go >/dev/null 2>&1; then
    export PATH="$PATH:$(go env GOPATH)/bin"
fi

# haskell
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

# rust
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# # nvm
# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
