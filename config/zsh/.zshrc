# / Bo-En Shao / @boenshao
# ⁽⁽٩(๑˃̶͈̀ ᗨ ˂̶͈́)۶⁾⁾

# helpers
check_cmd () { command -v "$1" >/dev/null }
is_in_vscode () { [ "$TERM_PROGRAM" = "vscode" ] }
is_in_vim () { [ -n "$VIMRUNTIME" ] }
is_in_tmux () { [ -n "$TMUX" ] }
is_in_zellij () { [ -n "$ZELLIJ" ] }

# zsh
HISTFILE="$ZDATA/zsh_history"
ZLE_RPROMPT_INDENT=0

# set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# download zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
# load zinit
source "${ZINIT_HOME}/zinit.zsh"

# zstyle
zstyle ':omz:plugins:nvm' lazy yes

# zinit plugins
zinit ice depth"1"
zinit light romkatv/powerlevel10k
zinit snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/history.zsh
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting
zinit light conda-incubator/conda-zsh-completion
zinit snippet OMZ::plugins/git
zinit snippet OMZ::plugins/aws
zinit snippet OMZ::plugins/gh
zinit snippet OMZ::plugins/terraform
zinit ice as"completion"
zinit snippet OMZ::plugins/terraform/_terraform
zinit snippet OMZ::plugins/kubectl
zinit snippet OMZ::plugins/helm
zinit snippet OMZ::plugins/nvm
zinit snippet OMZ::plugins/npm
zinit snippet OMZ::plugins/golang
zinit ice as"completion"
zinit snippet OMZ::plugins/golang/_golang
zinit snippet OMZ::plugins/rust
zinit ice as"completion"
zinit snippet OMZ::plugins/rust/_rustc

# load completions
mkdir -p $ZSH_CACHE_DIR/completions
zinit add-fpath --front $ZSH_CACHE_DIR/completions
autoload -Uz compinit && compinit
zinit cdreplay -q
# uv completions
if check_cmd uv; then
    eval "$(uv generate-shell-completion zsh)"
fi
# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
# kubectl completions
[ -s "$ZSH_CACHE_DIR/completions/_kubectl" ] && source "$ZSH_CACHE_DIR/completions/_kubectl"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

export PF_INFO="ascii title os host kernel shell uptime palette"
if check_cmd pfetch && ! is_in_vscode && ! is_in_vim && ! is_in_tmux && ! is_in_zellij; then
    pfetch
fi

# bat
export BAT_THEME="gruvbox-dark"

# fzf
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d"
source <(fzf --zsh)

# alias
alias rm="rm -i"
if check_cmd nvim; then
    alias vi="nvim"
    alias vim="nvim"
    export VISUAL="nvim"
    export EDITOR="nvim"
fi
if check_cmd exa; then
    alias ls="exa"
fi
if check_cmd eza; then
    alias ls="eza"
fi
if check_cmd zoxide; then
    eval "$(zoxide init zsh)"
fi

# python venv
activate-closest-python-venv() {
    if [ -n "$DISABLE_AUTO_VENV" ] || [ -n "$POETRY_ACTIVE" ]; then
        return
    fi

    if [[ "$PWD" != "$HOME"* ]]; then
        return
    fi

    declare -f deactivate > /dev/null && deactivate

    check="$PWD"
    while [ "$check" != $(realpath "$HOME/..") ]; do  # Check until home directory
        [ -f "$check/.venv/bin/activate" ] && source "$check/.venv/bin/activate" && return
        check=$(realpath "$check/..")
    done
}
add-zsh-hook chpwd activate-closest-python-venv
activate-closest-python-venv

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r "$HOME/.opam/opam-init/init.zsh" ]] || source "$HOME/.opam/opam-init/init.zsh" > /dev/null 2> /dev/null
# END opam configuration

# load local config
[ -f $ZDOTDIR/.zshrc.local ] && source $ZDOTDIR/.zshrc.local

. "$HOME/.local/share/../bin/env"
