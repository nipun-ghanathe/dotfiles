# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# exports
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=xdg-open
export PAGER="less -R"
export LESS="R"
# export PAGER="less -FRX"
# export LESS="FRX"

# paths
[[ -d "$HOME/bin" ]] && export PATH="$HOME/bin:$PATH"
[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

# history options
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignoreboth # ignore duplicates and commands starting with space

# prompt
long_prompt='\[\e[0;34m\]\w\[\e[0;32m\] \$ \[\e[0m\]'
short_prompt='\[\e[0;32m\] \$ \[\e[0m\]'
PS1=$long_prompt
toggle_short_prompt() {
  [[ "$PS1" == "$long_prompt" ]] && PS1="$short_prompt" || PS1="$long_prompt"
}

# aliases
alias vi="nvim"
alias ls="ls --color=auto --group-directories-first"
alias la="ls -A"
alias ll="ls -lh"
alias l="ls -lAh"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

#functions
v() {
  [[ -z "$NVIM" ]] && echo "v: made for running in neovim terminals only" >&2 && return 1
  [[ "$#" -ne 1 ]] && echo "v: error: only one argument is allowed" >&2 && return 1
  nvim --server "$NVIM" --remote-tab "$(realpath "$1")"
}

# shell integrations
eval "$(uv generate-shell-completion bash)"
eval "$(fzf --bash)"
