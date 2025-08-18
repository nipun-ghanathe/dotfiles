# Exports
export EDITOR=nvim
export BROWSER=xdg-open
export LANG=en_US.UTF-8
export PAGER="less -R"
export LESS="R"

# Prompt setup
export PS1='\[\e[0;32m\]$\[\e[0m\] '

# Source ~/.bash_aliases
if [[ -f ~/.bash_aliases ]]; then
  source ~/.bash_aliases
fi

# Source ~/.bash_profile
if [[ -f ~/.bash_profile ]]; then
  source ~/.bash_profile
fi

# Enabling programmable completion features
if ! shopt -oq posix; then
  if [[ -f /usr/share/bash-completion/bash_completion ]]; then
    source /usr/share/bash-completion/bash_completion
  elif [[ -f /etc/bash_completion ]]; then
    source /etc/bash_completion
  fi
fi
