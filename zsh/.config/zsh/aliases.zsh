# To see the list of all aliases use command `alias` in command line

# vim
alias vi="nvim"

# python
alias python="python3"
alias py="python3 -X pycache_prefix=/tmp/pycache"
alias ipython="ipython3"
alias ipy="ipython3"

# git
alias gs="git status"
alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gd="git diff"
alias gco="git checkout"

# move, copy, remove
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -v"

# ls
alias ls="eza --icons --group --group-directories-first"
alias l="ls -lah"
alias la="ls -A"
alias ll="ls -lh"

# batcat
alias cat="batcat"

# grep
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

# cd
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# mkdir
alias md="mkdir -p"

# history
alias history="fc -il 1"
