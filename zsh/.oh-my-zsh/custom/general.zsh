# Setting default editors, pages, etc
# Vim is already set as the default editor in .zshrc
export PAGER=batcat
export BAT_PAGER="less -FRX"
export MANPAGER="less -FRX"
export BROWSER=xdg-open

# fzf integration
eval "$(fzf --zsh)"
export FZF_DEFAULT_OPTS="--preview='batcat --color=always {}'"

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# eza
alias ls="eza --group-directories-first --icons"

# batcat
alias cat="batcat"

# Starship prompt
eval "$(starship init zsh)"

# Making tmux launch at shell startup
# if [ -z "$TMUX" ]; then
#   tmux -A -s main
# fi

# # Fastfetch at startup
# fastfetch
