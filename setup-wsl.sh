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

sudo apt update && sudo apt upgrade

sudo apt install -y \
  git cargo curl stow \
  neovim tmux \
  zoxide fzf bat wl-clipboard \
  python3 python3-pip python3-venv gcc

# Installing apps via cargo
echo
echo "--- Installing cargo packages: kanata, clock-rs, ---"
echo

echo "No apps to install via cargo right now"

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
  bash \
  git \
  nvim \
  profile \
  tmux \

echo
echo "Setup complete!"
echo "You might want to reboot the system"
