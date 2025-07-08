#!/bin/bash
#
# main.sh : Bootstrap the setup

set -euo pipefail

LOGFILE="/tmp/dotfiles-setup.log"
exec > >(tee -a "$LOGFILE") 2>&1

log() {
  echo -e "\e[1;34m[INFO]\e[0m $*"
}

err() {
  echo -e "\e[1;31m[ERROR]\e[0m $*" >&2
  exit 1
}

if [[ "$EUID" -eq 0 ]]; then
  err "Do not run this script as root. Log in as the target user who should receive setup."
fi

if ! groups "$USER" | grep -qw sudo; then
  err "User '$USER' is not in the 'sudo' group.
Please run: su -
Then: usermod -aG sudo $USER
Then reboot or log out/in.
"
fi

log "Updating apt-cache and upgrading apps..."
sudo apt update && sudo apt upgrade -y

log "Installing base tools (curl, wget, stow, git)"
sudo apt install -y curl wget stow git

if [[ ! -d "$HOME/dotfiles" ]]; then
  log "Cloning the dotfiles repo..."
  git clone "https://github.com/nipun-ghanathe/dotfiles" "$HOME/dotfiles"
else
  log "Dotfiles folder already present."
fi

cd "$HOME/dotfiles"

source ./setup/10-lang.sh
install_languages

source ./setup/20-terminal.sh
setup_terminal

source ./setup/30-other-tools.sh
install_other_tools

source ./setup/40-desktop.sh
setup_desktop

source ./setup/50-apps.sh
install_apps

source ./setup/60-misc.sh
setup_misc

log "✅ Setup complete!"
log "You can find the log of the setup at $LOGFILE"
log "❗Make sure you do the manual steps mentioned in the README's post-install section."
log "THe README can be found at ~/dotfiles/README.md"

