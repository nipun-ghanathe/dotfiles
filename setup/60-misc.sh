#!/bin/bash
#
# 60-misc.sh : Miscellaneous

setup_cronjobs() {
  log "Setting up Cron jobs..."
  crontab $HOME/dotfiles/cron/my_crontab
}

setup_misc() {
  setup_cronjobs
}

