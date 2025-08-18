# vim
alias vi="nvim"

# git
alias gs="git status"
alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gd="git diff"
alias gco="git checkout"

# python
alias python="python3"
alias ipython="ipython3"

# move, copy, remove
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -v"

# ls
alias ls="eza --icons --hyperlink --group --group-directories-first"
alias l="ls -lah"
alias la="ls -A"
alias ll="ls -lh"
alias lt="ls -T"
alias tree="ls -T"

# batcat
alias cat="batcat --style plain --paging always"

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

# history
alias history="fc -il 1"
