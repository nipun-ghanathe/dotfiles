setopt prompt_subst

export VIRTUAL_ENV_DISABLE_PROMPT=1

get_env_name() {
  if [[ -n "$CONDA_DEFAULT_ENV" ]]; then
    echo " %F{cyan}( $CONDA_DEFAULT_ENV)%f"
  elif [[ -n "$VIRTUAL_ENV" ]]; then
    echo " %F{yellow}( $VIRTUAL_ENV_PROMPT)%f"
  fi
}

precmd() {
  if [[ $? -eq 0 ]]; then
    # prompt_symbol="%F{green}➜%f"
    prompt_symbol="%F{green}❯%f"
  else
    # prompt_symbol="%F{red}✗%f"
    prompt_symbol="%F{red}❯%f"
  fi
}

PROMPT=$'%F{blue}%~%f'
PROMPT+='$(get_env_name)'
PROMPT+=$'\n${prompt_symbol} ' 

PS2='%F{green}›%f ' 
