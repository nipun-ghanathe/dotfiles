# vim
nv() {
  if [[ -z "$1" ]]; then
    nvim
  elif [[ -d "$1" ]]; then
    cd "$1" || return 1
    nvim .
    # nvim -c "Telescope find_files"
  elif [[ -f "$1" ]]; then
    cd "$(dirname "$1")" || return 1
    nvim "$(basename "$1")"
  else
    nvim "$1"
  fi
}

# activating conda
miniconda() {
  source "$HOME/miniconda3/bin/activate"
  if [[ -n "$1" ]]; then
    conda activate "$1"
  fi
}

# short prompt
short_prompt() {
  export RPROMPT=""
  export PS1=$'\n%F{green}$%f '
}
