#!/bin/bash

cat <<EOF
It is assumed that the following is true:
    - The user is in sudo group
    - You have internet access
    - Git is installed and the dotfiles repo has been cloned to ~/dotfiles

Press ENTER to continue...
EOF
read -r

if ! groups $USER | grep -q '\bsudo\b'; then
  echo "Error: user '$USER' is not in the sudo group."
  echo "Run: su -"
  echo "Then add user to sudo group: usermod -aG sudo $USER"
  echo "Then reboot and rerun the script."
  exit 1
fi

# Installing basic apps via apt
echo
echo "=================================================="
echo " Updating package lists and installing basic apps "
echo "=================================================="
echo

sudo apt update && sudo apt install -y \
  git cargo curl stow \
  kitty zsh neovim vim \
  eza zoxide fzf bat wl-clipboard \
  starship fastfetch \
  sway waybar \
  libnotify-bin mako-notifier brightnessctl \
  thunar ranger \
  python3 python3-pip python3-venv ipython3

# Installing apps via cargo
echo
echo "--- Installing cargo packages: kanata, clock-rs, ---"
echo

cargo install kanata
cargo install clock-rs

# Installing node.js
echo
echo "--- Installing Node.js via NVM ---"
echo

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
\. "$HOME/.nvm/nvm.sh"
nvm install 22

# Cloning our dotfiles repo and stowing our dotfiles
echo
echo "--- Setting up dotfiles ---"
echo

# git clone https://github.com/nipun-ghanathe/dotfiles.git $HOME/dotfiles
cd $HOME/dotfiles
rm ~/.bashrc
stow --verbose \
  kitty \
  bash \
  clock-rs \
  fonts \
  git \
  gnome \
  kanata \
  mako \
  nvim \
  profile \
  qt5 \
  sway \
  swaylock \
  themes \
  tmux \
  vimrc \
  waybar

# Installing oh-my-zsh and configuring it
echo
echo "--- Installing Oh My Zsh and configuring zsh ---"
echo

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm ~/.zshrc
cd $HOME/dotfiles
stow zsh
chsh -s $(which zsh)

# Configuring gnome
echo
echo "--- Applying GNOME settings ---"
echo

bash $HOME/dotfiles/gnome/load-gnome-settings.sh

# Some configuration for kanata to run properly
echo
echo "--- Configuring uinput permissions for kanata ---"
echo

sudo groupadd uinput
sudo usermod -aG input $USER
sudo usermod -aG uinput $USER
sudo tee /etc/udev/rules.d/99-input.rules > /dev/null <<EOF
KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static-node=uinput"
EOF
sudo udevadm control --reload-rules && sudo udevadm trigger
sudo modprobe uinput

# Installing fonts-indic to render Indian languages
echo
echo "--- Installing fonts-indic to render Indian languages ---"
echo

sudo apt install fonts-indic

echo
echo "Setup complete!"
echo "You might want to reboot the system"
