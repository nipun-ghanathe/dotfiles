# source config files
for file in "$HOME/.config/shell/"*.shell; do
  source "$file"
done
for file in "$HOME/.config/shell/"*.zsh; do
  source "$file"
done

# enable programmable completion features
if ! shopt -oq posix; then
  if [[ -f "/usr/share/bash-completion/bash_completion" ]]; then
    source "/usr/share/bash-completion/bash_completion"
  elif [[ -f "/etc/bash_completion" ]]; then
    source "/etc/bash_completion"
  fi
fi
