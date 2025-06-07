# Setting default editors, pages, etc
export EDITOR=nvim
export PAGER=batcat
export BAT_PAGER="less -FRX"
export MANPAGER="less -FRX"
export BROWSER=xdg-open

# options
setopt autocd             # cd by typing dir name
setopt extended_glob      # advanced globbing
setopt hist_ignore_dups   # ignore duplicate history entries
setopt share_history      # share command history across terminals

set -o emacs

# completions
autoload -Uz compinit
if [[ ! -f ~/.zcompdump ]] || [[ ~/.zcompdump -ot ~/.zshrc ]]; then
  compinit
  compdump
else
  compinit -C
fi
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case-insensitive

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# fzf integration
eval "$(fzf --zsh)"
export FZF_DEFAULT_OPTS="--preview='batcat --color=always {}'"

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# # Making tmux launch at shell startup
# if [ -z "$TMUX" ]; then
#   tmux -A -s main
# fi
