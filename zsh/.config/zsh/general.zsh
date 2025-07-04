# Exports
export EDITOR=nvim
export BROWSER=xdg-open
export LANG=en_US.UTF-8
export PAGER="less -R"
export LESS="R"
# export PAGER="less -FRX"
# export LESS="FRX"

# Options
setopt autocd             # cd by typing dir name
setopt extended_glob      # advanced globbing
setopt hist_ignore_dups   # ignore duplicate history entries
setopt share_history      # share command history across terminals

# Keybindings
set -o emacs              # emacs like motions on the command line
bindkey -s '^x^f' 'tmux-sessionizer\n'

# Completions
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'  # case-insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Shell integrations

# fzf
eval "$(fzf --zsh)"
export FZF_DEFAULT_OPTS="--preview='batcat --color=always {}'"

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# # Making tmux launch at shell startup
# [ -z "$TMUX" ] && tmux new-session -A -s main

# uv
eval "$(uv generate-shell-completion zsh)"

# node.js
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
