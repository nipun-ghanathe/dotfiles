# source config files
source "$HOME/.config/bash/general.bash"
source "$HOME/.config/bash/exports.bash"
source "$HOME/.config/bash/aliases.bash"
source "$HOME/.config/bash/functions.bash"
source "$HOME/.config/bash/prompt.bash"

# enable programmable completion features
if ! shopt -oq posix; then
  if [[ -f "/usr/share/bash-completion/bash_completion" ]]; then
    source "/usr/share/bash-completion/bash_completion"
  elif [[ -f "/etc/bash_completion" ]]; then
    source "/etc/bash_completion"
  fi
fi
