# exports
export EDITOR=nvim
export BROWSER=xdg-open
export LANG=en_US.UTF-8
export PAGER="less -R"
export LESS="R"
# export PAGER="less -FRX"
# export LESS="FRX"

# paths
[[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH"
[[ -d "$HOME/.local/bin" ]] && PATH="$HOME/.local/bin:$PATH"
[[ -d "$HOME/.cargo/bin" ]] && PATH="$HOME/.cargo/bin:$PATH"
[[ -d "$HOME/.local/share/gem/ruby/3.3.0/bin" ]] && PATH="$HOME/.local/share/gem/ruby/3.3.0/bin:$PATH"

# node.js
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# cargo
. "$HOME/.cargo/env"

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
