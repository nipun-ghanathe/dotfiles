#!/bin/bash
#
# update.sh : Update all your tools and apps

# Helper functions
log() {
  printf "\n\e[1;34m[INFO]\e[0m %s\n\n" "$@"
}
error() {
  printf "\n\e[1;31m[ERROR]\e[0m %s\n\n" "$@"
}

# APT Packages
log "Modernizing APT sources..."
sudo apt modernize-sources # modernize-sources if any
log "Updating APT packages..."
sudo apt update
sudo apt full-upgrade -y
log "Auto-removing APT packages..."
sudo apt autoremove --purge -y

# Rust
log "Updating Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
# Cargo Packages
log "Updating Cargo packages..."
if command -v cargo-install-update &>/dev/null; then
  cargo install-update -a
else
  error "cargo-update not found. Run: cargo install cargo-update"
fi

# uv tools
log "Updating UV..."
uv self update
log "Updating tools installed with UV..."
uv tool upgrade --all

# Ruby Gems
log "Updating gems..."
sudo gem update

# npm tools
log "Updating npm packages..."
npm update -g

# Neovim
log "Checking for Neovim updates..."
if [[ ! -d "$HOME/builds/neovim/" ]]; then
  mkdir -p "$HOME/builds"
  git clone "https://github.com/neovim/neovim" "$HOME/builds/neovim"
fi
cd "$HOME/builds/neovim"
git switch master
git pull
git fetch --tags --force
git -c advice.detachedHead=false checkout stable
current_nvim_version=$(nvim -v | awk 'NR==1 {print $2}')
latest_nvim_version=$(git tag --list --contains HEAD | sed -n '2p')
if [[ "$current_nvim_version" == "$latest_nvim_version" ]]; then
  git switch -
  log "Neovim is up to date..."
else
  log "Updating Neovim..."
  make clean
  rm -rfv build .deps
  make CMAKE_BUILD_TYPE=RelWithDebInfo
  sudo make install
  git switch -
  cd "$HOME/dotfiles" && stow --verbose nvim
  mkdir -p "$HOME/.cache/nvim/undodir"
fi

# Notice
log "Automated updating completed."
log "Currently you need to manually check for updates for the following:"
cat <<'EOF' | column -t -s '|'
AppImageLauncher|https://github.com/TheAssassin/AppImageLauncher/releases
ZenBrowser|Would perhaps get auto-updated
EOF
