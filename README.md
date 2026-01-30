This repo stores all my configuration files.

The main color theme used is based on Graphite-gtk-theme which is based on
[2014 Material Design Color Palette](https://m2.material.io/design/color/the-color-system.html#tools-for-picking-colors). I have mainly used the 300 colors.

# Usage

Install git and clone this repository

```bash
sudo pacman -S --needed git
git clone --depth=1 "https://github.com/nipun-ghanathe/dotfiles.git" "$HOME/dotfiles"
```

Install pacman packages

```bash
sudo pacman -S --needed - < "$HOME/dotfiles/extras/pkglists/pkglist.txt"
sudo pacman -S --needed - < "$HOME/dotfiles/extras/pkglists/pkglist-extras.txt"
```

Stow dotfiles

```bash
cd "$HOME/dotfiles"
stow .
```

_After stowing dotfiles_

Install npm global packages

```bash
npm install -g $(cat "$HOME/dotfiles/extras/pkglists/npm-pkglist.txt")
```

Create some symlinks

```bash
ln -s "$HOME/dotfiles/extras/tmux-session-manager/tmux-session-manager" "$HOME/.local/bin/tmux-session-manager"
sudo ln -s "$HOME/configs/keyd.conf" "/etc/keyd/default.conf"
```

Enable some systemd services

```bash
systemctl --user enable --now foot-server.socket
sudo systemctl enable --now keyd
```

# Post Install

After doing the above installation and setup, you may still want to do these
manual things:

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

# TODOs

- [ ] Learn to create systemd services and create a service with daily timer for auto drive backup
- [ ] Introduce frecency to tmux-session-manager
- [ ] Add custom snippets to Neovim
- [ ] Make a way to automate the setup - script / ISO
- [ ] Read documentation of each and every tool you use
