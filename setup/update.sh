#!/bin/bash
#
# update.sh : Update all your tools and apps

# APT Packages
sudo apt modernize-sources # modernize-sources if any
sudo apt update
sudo apt full-upgrade -y
sudo apt autoremove --purge -y

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
# Cargo Packages
if command -v cargo-install-update &>/dev/null; then
  cargo install-update -a
else
  echo "cargo-update not found. Run: cargo install cargo-update"
fi

# uv tools
uv self update
uv tool upgrade --all

# Ruby Gems
sudo gem update

# npm tools
npm update -g

# Neovim
if [[ ! -d "$HOME/builds/neovim/" ]]; then
  mkdir -p "$HOME/builds"
  git clone "https://github.com/neovim/neovim" "$HOME/builds/neovim"
fi
cd "$HOME/builds/neovim"
git switch master
git pull
git fetch --tags --force
git checkout stable
current_nvim_version=$(nvim -v | awk 'NR==1 {print $2}')
latest_nvim_version=$(git tag --list --contains HEAD | sed -n '2p')
if [[ "$current_nvim_version" == "$latest_nvim_version" ]]; then
  echo "Neovim is up to date."
else
  make clean
  rm -rfv build .deps
  make CMAKE_BUILD_TYPE=RelWithDebInfo
  sudo make install
  git switch -
  cd "$HOME/dotfiles" && stow --verbose nvim
  mkdir -p "$HOME/.cache/nvim/undodir"
fi
