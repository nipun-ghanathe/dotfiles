# uv
eval "$(uv generate-shell-completion bash)"

#fzf
eval "$(fzf --bash)"
source "$HOME/.config/fzf/fzf-config.sh"

# zoxide
eval "$(zoxide init --cmd cd bash)"

# # nodejs - nvm  # nodejs has already been added to path in .bash_profile
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
