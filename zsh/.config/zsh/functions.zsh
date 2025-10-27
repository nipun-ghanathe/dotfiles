# change cwd with yazi
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  /usr/bin/rm -f -- "$tmp"
}

# change cwd with ranger
function ranger-cd() {
  local tmp="$(mktemp -t "ranger-cwd.XXXXXX")" cwd
  ranger "$@" --choosedir="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  /usr/bin/rm -f -- "$tmp"
}
