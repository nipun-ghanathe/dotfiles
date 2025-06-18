# exports
export EDITOR=nvim
export PAGER=batcat
export BAT_PAGER="less -FRX"
export MANPAGER="less -FRX"
export BROWSER=xdg-open
export LANG=en_US.UTF-8

# history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_find_no_dups

# options
setopt autocd
setopt extended_glob

# keybindings
bindkey -e  # emacs mode and now you can use ^F to accept autosuggestions
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# completions
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case-insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select # to remove or not???

### shell integrations
#
# fzf
eval "$(fzf --zsh)"
export FZF_DEFAULT_OPTS="--preview='batcat --color=always {}'"
#
# zoxide
eval "$(zoxide init --cmd cd zsh)"
#
# uv
eval "$(uv generate-shell-completion zsh)"
#
# tmux
# [ -z "$TMUX" ] && tmux new-session -A -s main
#
# node.js
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
