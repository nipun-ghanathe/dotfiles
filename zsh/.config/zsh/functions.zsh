# change cwd with yazi
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  /usr/bin/rm -f -- "$tmp"
}

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

# short prompt
short_prompt() {
  export RPROMPT=""
  export PS1=$'\n%F{green}$%f '
}
