This repo stores all my configuration files.

The main color theme used is based on Graphite-gtk-theme which is based on
[2014 Material Design Color Palette](https://m2.material.io/design/color/the-color-system.html#tools-for-picking-colors). I have mainly used the 300 colors.

# Usage

_(After installing all required packages - see next section for installation)_

To get all the main config files:

```bash
git clone --depth=1 "https://github.com/nipun-ghanathe/dotfiles.git" "$HOME/dotfiles"
cd "$HOME/dotfiles"
stow .
```

To use any of the `extras` config files, cd into `dotfiles/extras` and use

```bash
stow -t ~ <package>
```

# Installing Packages

You can install all the required packages using

```bash
sudo pacman -S --needed - < "$HOME/dotfiles/extras/pkglist.txt"
sudo pacman -S --needed - < "$HOME/dotfiles/extras/pkglist-extras.txt"
```

# Post Install

After doing the above installation and setup, you may still want to do these
manual things:

- Setup rclone and auto drive backup for every 3 days

  ```bash
  rclone config create gdrive drive
  ```

  ```bash
  systemctl --user daemon-reload
  systemctl --user enable --now drive_backup.timer
  ```

# Optional - Post Install

- Set up Tridactyl _(If Firefox sync doesn't)_

  ```
  :source --url https://raw.githubusercontent.com/nipun-ghanathe/dotfiles/refs/heads/main/extras/tridactyl/.tridactylrc
  ```

# TODOs

- [ ] Make a way to automate the setup - script / ISO
