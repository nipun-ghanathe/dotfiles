get_env_name() {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    echo "($VIRTUAL_ENV_PROMPT)"
  elif [[ -n "$CONDA_DEFAULT_ENV" ]]; then
    echo "($CONDA_DEFAULT_ENV)"
  fi
}
export PS1='\[\e[0;34m\]\w\[\e[0;33m\] $(get_env_name) \n\[\e[0;32m\]\$ \[\e[0m\]'
