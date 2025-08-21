#!/bin/bash
#
# update.sh : Update all your tools and apps

# APT Packages
sudo apt update && sudo apt upgrade -y

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
