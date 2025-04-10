# Setting default editors, pages, etc
# Vim is already set as the default editor in .zshrc
export PAGER=batcat
export BAT_PAGER="less -FR"
export BROWSER=xdg-open

# fzf integration
eval "$(fzf --zsh)"
export FZF_DEFAULT_OPTS="--preview='batcat --color=always {}'"

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# eza
alias ls="eza --group-directories-first --icons"

# grep
alias grep="grep --color=auto"

# batcat
alias cat="batcat"

# Adding paths
export PATH="$HOME/.cargo/bin:$PATH"
