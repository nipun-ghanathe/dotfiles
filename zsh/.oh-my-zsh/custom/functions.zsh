# vim
nv() {
  local dir="${1:-.}"
  cd $dir || return
  nvim "$(fzf)"
}

# activating conda
miniconda() {
  source $HOME/miniconda3/bin/activate
  local env="${1:-base}"
  conda activate "$env"
}
