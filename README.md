This repo stores all my configuration files.

The main color theme used is based on Graphite-gtk-theme which is based on
[2014 Material Design Color Palette](https://m2.material.io/design/color/the-color-system.html#tools-for-picking-colors).
I have mainly used the 300 colors.

# Usage

Install git and clone this repository

```bash
sudo pacman -S --needed git
git clone --depth=1 "https://github.com/nipun-ghanathe/dotfiles.git" "$HOME/dotfiles"
```

Install pacman packages

```bash
sudo pacman -S --needed - < "$HOME/dotfiles/extras/pkglists/pacman-core.txt"
sudo pacman -S --needed - < "$HOME/dotfiles/extras/pkglists/pacman-extras.txt"
```

Stow dotfiles

```bash
cd "$HOME/dotfiles"
stow .
```

_After stowing dotfiles_

- Install npm global packages

  ```bash
  npm install -g $(cat "$HOME/dotfiles/extras/pkglists/npm.txt")
  ```

- Setup keyd

  ```bash
  sudo ln -s "$HOME/dotfiles/extras/keyd/default.conf" "/etc/keyd/default.conf"
  sudo systemctl enable --now keyd
  ```

- Install Browser (Brave)

  ```bash
  # Build brave-browser from AUR
  mkdir -p "$HOME/builds"
  git clone "https://aur.archlinux.org/brave-bin.git" "$HOME/builds/brave-bin"
  cd "$HOME/builds/brave-bin"
  makepkg -si

  # Make it default
  xdg-mime default brave-browser.desktop x-scheme-handler/http
  xdg-mime default brave-browser.desktop x-scheme-handler/https
  xdg-mime default brave-browser.desktop text/html
  ```

# Optional - Post Install

- Setup rclone and copy files from remote to local

  ```bash
  sudo pacman -S rclone
  rclone config create gdrive drive
  rclone copy gdrive:backup "$HOME"
  ```

  To sync to remote

  ```bash
  $HOME/.local/bin/sync-gdrive.sh
  ```

  Setup systemd timer

  ```bash
  mkdir -p "$HOME/.config/systemd/user"
  cp "$HOME/dotfiles/extras/systemd/sync-gdrive/"* "$HOME/.config/systemd/user/"
  systemctl --user daemon-reload
  systemctl --user enable --now sync-gdrive.timer
  ```

# TODOs

- [ ] Add custom snippets to Neovim
- [ ] Make a way to automate the setup - script / ISO
