# Options
setopt autocd             # cd by typing dir name
setopt extended_glob      # advanced globbing
setopt hist_ignore_dups   # ignore duplicate history entries
setopt share_history      # share command history across terminals

# Keybindings
set -o emacs              # emacs like motions on the command line

# Completions
autoload -Uz compinit && compinit  # line moved to minimal.zsh (for uv completions)
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'  # case-insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Shell integrations

# uv
eval "$(uv generate-shell-completion zsh)"

# fzf
eval "$(fzf --zsh)"
source "$HOME/.config/fzf/fzf-config.sh"

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# # nodejs - nvm  # nodejs has already been added to path in .zprofile
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# # conda
# __conda_setup="$('/home/nipun/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#   eval "$__conda_setup"
# else
#   if [ -f "/home/nipun/miniconda3/etc/profile.d/conda.sh" ]; then
#     . "/home/nipun/miniconda3/etc/profile.d/conda.sh"
#   else
#     export PATH="/home/nipun/miniconda3/bin:$PATH"
#   fi
# fi
# unset __conda_setup
