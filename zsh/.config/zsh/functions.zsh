# vim
nv() {
  if [[ -d "$1" ]]; then
    cd "$1"
  fi
  nvim -c "Telescope find_files"
}

# activating conda
miniconda() {
  source $HOME/miniconda3/bin/activate
  if [[ -n "$1" ]]; then
    conda activate "$1"
  fi
}

# short prompt
short_prompt() {
  export RPROMPT=""
  export PROMPT=$'\n%F{green}$ %f'
}

# tmuxinator
tx() {
  if [[ -z "$1" ]]; then
    echo 'tmuxinator ls'
    tmuxinator ls
    return
  fi

  local command="$1"
  local selected="$(tmuxinator ls | fzf)"
  echo "tmuxinator $command $selected"
  tmuxinator "$command" "$selected"
}
