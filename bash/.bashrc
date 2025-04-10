# Setting default editors, pagers, etc
export EDITOR=nvim
export VISUAL=nvim
export PAGER=batcat
export BAT_PAGER="less -FR"
export BROWSER=xdg-open

# Starship prompt
eval "$(starship init bash)"

# fzf integration
eval "$(fzf --bash)"
export FZF_DEFAULT_OPTS="--preview='batcat --color=always {}'"

# zoxide
eval "$(zoxide init --cmd cd bash)"

# eza
alias ls="eza --group-directories-first --icons"

# grep
alias grep="grep --color=auto"

# batcat
alias cat="batcat"

# Configuring History
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=10000
export HISTFILESIZE=20000
shopt -s histappend
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Sourcing ~/.bash_aliases 
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Enabling programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Adding paths
export PATH="$HOME/.cargo/bin:$PATH"
