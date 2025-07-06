#!/bin/bash
#
# install_packages.sh

# ========================================================================
# === Helper functions ===
# ========================================================================



# ========================================================================
# === Tools required for installations ===
# ========================================================================

tools_requried_further_func() {
  sudo apt install -y wget curl
}

# ========================================================================
# === Programming Languages and their Package Managers ===
# ========================================================================

c_func() {
  sudo apt install -y build-essential cmake
}

rust_func() {
  curl https://sh.rustup.rs -sSf | sh
}

python_func() {
  sudo apt install -y python3-full

  curl -LsSf https://astral.sh/uv/install.sh | sh

  uv tool install ipython

  mkdir -p ~/miniconda3
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
  bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
  rm ~/miniconda3/miniconda.sh
  stow --verbose conda
}

ruby_func() {
  sudo apt install -y ruby-full
}

nodejs_func() {
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
  \. "$HOME/.nvm/nvm.sh"
  nvm install node
  corepack enable yarn
}

# ========================================================================
# === Primary Shell Tools ===
# ========================================================================

git_func() {
  sudo apt install -y git
  stow --verbose git

  (type -p wget >/dev/null || (sudo apt update && sudo apt install wget -y)) \
    && sudo mkdir -p -m 755 /etc/apt/keyrings \
    && out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
    && cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
    && sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
    && sudo mkdir -p -m 755 /etc/apt/sources.list.d \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && sudo apt update \
    && sudo apt install gh -y
}

neovim_func() {
  sudo apt install -y neovim
  stow --verbose nvim
  mkdir -p "$HOME/.cache/nvim/undodir"
}

editor_setup_func() {
  # LSPs, Linters, Formatters and other things
  # currently:
  stow --verbose ruff mypy
}

tmux_func() {
  sudo apt install -y tmux
  stow --verbose tmux
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

shell_func() {
  rm ~/.bashrc ~/.profile
  stow --verbose bash profile

  sudo apt install -y zsh
  stow --verbose zsh
  sudo chsh -s "$(which zsh)"
}

kitty_func() {
  sudo apt install -y kitty
  stow --verbose kitty
  sudo update-alternatives --set x-terminal-emulator /usr/bin/kitty
}

scripts_func() {
  find "$HOME/dotfiles/scripts/.local/bin" -type f -exec chmod +x {} +
  mkdir -p "$HOME/.local/bin"
  stow --verbose scripts
}

# ========================================================================
# === Window Manager and Related Tools ===
# ========================================================================

window_manager_func() {
  sudo apt install -y sway
  stow --verbose sway

  sudo apt install -y swayidle swaylock
  stow --verbose swaylock

  sudo apt install -y waybar
  stow --verbose waybar

  sudo apt install -y fuzzel
  stow --verbose fuzzel

  sudo apt install -y pavucontrol brightnessctl

  sudo apt install -y wl-clipboard cliphist

  sudo apt install -y grim slurp swappy

  sudo apt install -y libnotify-bin mako-notifier
  stow --verbose mako

  find "$HOME/dotfiles/sway/.config/sway/scripts" -type f -exec chmod +x {} +

  stow --verbose qt5 themes
  gsettings gsettings set org.gnome.desktop.interface gtk-theme Nordic
  gsettings set org.gnome.desktop.wm.preferences theme Nordic

  stow --verbose fonts
  sudo apt install -y fonts-indic
}

# ========================================================================
# === Other CLI Tools ===
# ========================================================================

other_cli_tools_func() {
  sudo apt install -y eza zoxide bat ripgrep fd-find htop
  ln -sf "$(command -v fdfind)" "$HOME/.local/bin/fd"

  sudo apt install -y ranger
  npm install -g tldr
}

# ========================================================================
# === Other Tools ===
# ========================================================================

kanata_func() {
  cargo install kanata
  stow --verbose kanata

  sudo groupadd -f uinput
  sudo usermod -aG input,uinput "$USER"

  sudo tee /etc/udev/rules.d/99-input.rules > /dev/null <<EOF
KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static-node=uinput"
EOF

  sudo udevadm control --reload-rules && sudo udevadm trigger
  sudo modprobe uinput
}

rclone_func() {
  sudo -v ; curl https://rclone.org/install.sh | sudo bash
  cp "$HOME/dotfiles/rclone/rclone.conf" "$HOME/.config/rclone/rclone.conf"
}

# ========================================================================
# === Other Apps ===
# ========================================================================

firefox_func() {
  sudo install -d -m 0755 /etc/apt/keyrings
  wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
  gpg -n -q --import --import-options import-show /etc/apt/keyrings/packages.mozilla.org.asc | awk '/pub/{getline; gsub(/^ +| +$/,""); if($0 == "35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3") print "\nThe key fingerprint matches ("$0").\n"; else print "\nVerification failed: the fingerprint ("$0") does not match the expected one.\n"}'
  echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null
  echo '
  Package: *
  Pin: origin packages.mozilla.org
  Pin-Priority: 1000
  ' | sudo tee /etc/apt/preferences.d/mozilla 
  sudo apt update && sudo apt install -y firefox
}

obsidian_func() {
  echo "install obsidian"
}

thunar_func() {
  sudo apt install -y thunar
}


# ========================================================================
# === Miscellaneous ===
# ========================================================================

setup_cronjobs() {
  echo "--- Setting up cron jobs ---"
  crontab $HOME/dotfiles/cron/my_crontab
}


# do these
# 1. cd "$HOME/dotfiles"
# 2. sudo apt update && sudo apt upgrade -y (before doing all installs)
# 3. Confirm that it is $*
# 4. gh auth login
# 5. update things from cargo and npm and uv (make a separate script for this and run that every week using cron)
