#!/bin/bash
#
# main.sh : Bootstrap the setup

set -euo pipefail

LOGFILE="/tmp/dotfiles-setup.log"
exec > >(tee -a "$LOGFILE") 2>&1

log() {
  printf "\n\e[1;34m[INFO]\e[0m%s\n\n" "$@"
}

err() {
  printf "\n\e[1;31m[ERROR]\e[0m%s\n\n" "$@" >&2
  exit 1
}

if [[ "$EUID" -eq 0 ]]; then
  err "Do not run this script as root. Log in as the target user who should receive setup."
fi

if ! command -v sudo; then
  err "sudo command not found. Install sudo."
fi

if ! groups "$USER" | grep -qw sudo; then
  err "User not in sudo group. Add user to sudo group."
fi

log "Adding DebianUnstable to APT sources..."
# make sure the directories exist
mkdir -p /etc/apt/sources.list.d
mkdir -p /etc/apt/preferences.d
# add unstable sources
sudo tee /etc/apt/sources.list.d/sid.sources > /dev/null <<'EOF'
Types: deb
URIs: https://deb.debian.org/debian/
Suites: sid
Components: main contrib non-free non-free-firmware
Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg
EOF
# use pinning to prevent automatic installs from unstable
sudo tee /etc/apt/preferences.d/99-preferences > /dev/null <<'EOF'
Package: *
Pin: release n=trixie
Pin-Priority: 900

Package: *
Pin: release a=unstable
Pin-Priority: 100
EOF
# modernize-sources if any
sudo apt modernize-sources -y

log "Updating apt-cache and upgrading apps..."
sudo apt update
sudo apt upgrade -y

log "Installing base tools (curl, wget, stow, git)"
sudo apt install -y curl wget jq stow git

log "Updating PATH to include all required directories..."
source "$HOME/dotfiles/shell/.config/shell/paths.shell"

if [[ ! -d "$HOME/dotfiles" ]]; then
  log "Cloning the dotfiles repo..."
  git clone "https://github.com/nipun-ghanathe/dotfiles" "$HOME/dotfiles"
else
  log "Dotfiles folder already present."
fi

cd "$HOME/dotfiles"

source ./setup/10-desktop.sh && setup_desktop
source ./setup/20-apps.sh && install_apps
source ./setup/30-lang.sh && install_languages
source ./setup/40-terminal.sh && setup_terminal
source ./setup/50-other-tools.sh && install_other_tools
source ./setup/60-misc.sh && setup_misc

printf "\n\e[1;34m[DONE]\e[0m%s\n"
echo "✅ Setup complete!"
echo "You can find the log of the setup at $LOGFILE"
echo "❗Make sure you do the manual steps mentioned in the README's post-install section."
echo "The README can be found at ~/dotfiles/README.md"

