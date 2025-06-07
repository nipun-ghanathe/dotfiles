git_branch() {
  local branch dirty remote ahead behind remote_status
  # Branch check
  if branch=$(git symbolic-ref --short HEAD 2>/dev/null); then
    # Dirty check
    [[ -n $(git status --porcelain 2>/dev/null) ]] && dirty="*" || dirty=""

    # echo output
    echo "on %B%F{magenta} $branch%f%b%F{red}$dirty%f"
  fi
}

precmd() {
  if [[ $? -eq 0 ]]; then
    prompt_symbol="%B%F{green}➜%f%b"
  else
    prompt_symbol="%B%F{red}✗%f%b"
  fi
}

PROMPT=$'\n%B%F{cyan}%1~%f%b $(git_branch)\n%F{green}${prompt_symbol}%f '
