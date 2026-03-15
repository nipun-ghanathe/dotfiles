# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# history options
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignoreboth # ignore duplicates and commands starting with space

# prompt
source "/usr/share/git/git-prompt.sh"
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM=1
long_prompt='\[\e[0;34m\]\w\[\e[0;33m\]$(__git_ps1 " (%s)")\[\e[0;32m\] \$ \[\e[0m\]'
short_prompt='\[\e[0;32m\] \$ \[\e[0m\]'
PS1=$long_prompt
# function to toggle between short and long prompt
toggle_short_prompt() {
  [[ "$PS1" == "$long_prompt" ]] && PS1="$short_prompt" || PS1="$long_prompt"
}
alias tsp="toggle_short_prompt"

# aliases
alias tsm="tmux-session-manager"
alias vi="nvim"
alias ls="ls --color=auto --group-directories-first"
alias la="ls -a"
alias ll="ls -lh"
alias l="ls -lah"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

# shell integrations
eval "$(uv generate-shell-completion bash)"
eval "$(fzf --bash)"
