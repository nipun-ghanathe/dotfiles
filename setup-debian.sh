#!/bin/bash

# Enables strict mode: exits on errors, unset vars, and pipeline failures.
set -euo pipefail

echo "=================================================="
echo " Debian Setup Script                              "
echo "=================================================="

cat <<EOF
Assumptions:
    - User is in the sudo group
    - Internet is accessible
    - Git is installed and dotfiles are at ~/dotfiles

Press ENTER to continue...
EOF
read -r

check_prereqs() {
  if ! groups "$USER" | grep -qw sudo; then
    echo "Error: User '$USER' is not in the sudo group."
    echo "Run: su -"
    echo "Then: usermod -aG sudo $USER && reboot"
    exit 1
  fi

  if [ ! -d "$HOME/dotfiles" ]; then
    echo "Dotfiles directory not found at ~/dotfiles. Exiting."
    exit 1
  fi
}

install_apt_packages() {
  echo "--- Installing packages via apt ---"
  sudo apt update && sudo apt install -y \
    git cargo curl stow \
    kitty zsh neovim vim tmux \
    gcc cmake \
    python3 python3-pip python3-venv ipython3 \
    eza zoxide fzf bat \
    ripgrep fd-find htop \
    grim slurp wl-clipboard cliphist \
    sway waybar wofi \
    swaylock swayidle \
    thunar ranger \
    libnotify-bin mako-notifier brightnessctl \
    pavucontrol fonts-indic
}

install_cargo_packages() {
  echo "--- Installing cargo packages ---"
  cargo install kanata
  cargo install clock-rs
}

install_uv() {
  echo "--- Installing uv ---"
  curl -LsSf https://astral.sh/uv/install.sh | sh
}

install_rclone() {
  echo "--- Installing rclone ---"
  sudo -v ; curl https://rclone.org/install.sh | sudo bash
  cp "$HOME/dotfiles/rclone/rclone.conf" "$HOME/.config/rclone/rclone.conf"
}

install_node_tools() {
  echo "--- Installing Node.js and npm tools ---"
  export NVM_DIR="$HOME/.nvm"
  if [ ! -d "$NVM_DIR" ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
  fi
  # shellcheck disable=SC1090
  \. "$NVM_DIR/nvm.sh"
  nvm install node
  corepack enable yarn

  npm install -g tldr
}

setup_dotfiles() {
  echo "--- Setting up dotfiles ---"
  cd "$HOME/dotfiles"

  rm -f ~/.bashrc ~/.profile
  mkdir -p ~/.local/bin

  stow --verbose \
    kitty bash zsh clock-rs fonts git kanata mako \
    nvim profile qt5 sway swaylock themes tmux \
    fuzzel vimrc waybar misc conda ruff mypy
}

setup_symlinks() {
  echo "--- Creating symlinks ---"
  sudo ln -sf "$HOME/.local/bin/ranger-launch" /usr/local/bin/ranger-launch
  ln -sf "$(command -v fdfind)" "$HOME/.local/bin/fd"
}

configure_default_term() {
  echo "--- Changing default terminal to Kitty ---"
  sudo update-alternatives --set x-terminal-emulator /usr/bin/kitty
}

configure_neovim() {
  echo "--- Configuring Neovim ---"
  mkdir -p "$HOME/.cache/nvim/undodir"
}

configure_tmux() {
  echo "--- Configuring tmux ---"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm || true
}

configure_zsh() {
  echo "--- Making zsh the default shell ---"
  chsh -s "$(which zsh)"
}

configure_gtk_theme() {
  echo "--- Configuring GTK theme ---"
  gsettings set org.gnome.desktop.interface gtk-theme "Dracula-gtk"
  gsettings set org.gnome.desktop.wm.preferences theme "Dracula"
}

setup_kanata_uinput() {
  echo "--- Configuring uinput for kanata ---"
  sudo groupadd -f uinput
  sudo usermod -aG input,uinput "$USER"

  sudo tee /etc/udev/rules.d/99-input.rules > /dev/null <<EOF
KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static-node=uinput"
EOF

  sudo udevadm control --reload-rules
  sudo udevadm trigger
  sudo modprobe uinput
}

make_scripts_executable() {
  echo "--- Making scripts executable ---"
  chmod +x ~/.local/bin/ranger-launch
  find ~/.config/sway/scripts -type f -name "*.sh" -exec chmod +x {} \;
}

setup_cronjobs() {
  echo "--- Setting up cron jobs ---"
  crontab $HOME/dotfiles/cron/my_crontab
}

final_instructions() {
  echo
  echo "✅ Setup complete!"
  echo
  echo "❗Make sure you do other steps mentioned at https://github.com/nipun-ghanathe/dotfiles?tab=readme-ov-file#6-manual-setup-that-needs-to-be-done-post-setup"
}

main() {
  check_prereqs
  install_apt_packages
  install_cargo_packages
  install_uv
  install_rclone
  install_node_tools
  setup_dotfiles
  setup_symlinks
  configure_neovim
  configure_tmux
  configure_zsh
  configure_gtk_theme
  setup_kanata_uinput
  make_scripts_executable
  final_instructions
}

main
