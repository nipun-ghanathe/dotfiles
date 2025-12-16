# change cwd with ranger
function ranger-cd() {
  local tmp="$(mktemp -t "ranger-cwd.XXXXXX")" cwd
  ranger "$@" --choosedir="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  /usr/bin/rm -f -- "$tmp"
}
