# Evaluate variables and command substitutions inside prompt string
setopt prompt_subst

# Git Branch for prompt
git_branch() {
  local branch dirty # remote ahead behind remote_status
  # Branch check
  if branch=$(git symbolic-ref --short HEAD 2>/dev/null); then
    # Dirty check
    [[ -n $(git status --porcelain 2>/dev/null) ]] && dirty="*" || dirty=""

    # echo output
    echo " on %B%F{magenta} $branch%f%b%F{red}$dirty%f"
  fi
}

# Configuring Virtual Env and Conda for Prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1
get_env_name() {
  if [[ -n "$CONDA_DEFAULT_ENV" ]]; then
    echo " via %F{green}🅒 $CONDA_DEFAULT_ENV%f"
  elif [[ -n "$VIRTUAL_ENV" ]]; then
    echo " via %F{yellow}($VIRTUAL_ENV_PROMPT)%f"
  fi
}

# Before displaying prompt
precmd() {
  if [[ $? -eq 0 ]]; then
    prompt_symbol="%B%F{green}➜%f%b "
  else
    prompt_symbol="%B%F{red}✗%f%b "
  fi
}

# Setting different prompts
PROMPT=$'\n'
PROMPT+='%B%F{cyan}%1~%f%b'
PROMPT+='$(git_branch)'
PROMPT+='$(get_env_name)'
PROMPT+=$'\n${prompt_symbol}' 

PS2='%F{green}›%f ' 
