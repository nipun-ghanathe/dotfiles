# Options
setopt autocd             # cd by typing dir name
setopt extended_glob      # advanced globbing
setopt hist_ignore_dups   # ignore duplicate history entries
setopt share_history      # share command history across terminals

# Keybindings
set -o emacs              # emacs like motions on the command line

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
source "$HOME/.config/fzf/fzf-config.sh"

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# uv
eval "$(uv generate-shell-completion zsh)"
