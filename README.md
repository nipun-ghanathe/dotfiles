This repo stores all my configuration files.\
Multiple themes are available.

# Usage

_(After installing all required packages - see next section for installation)_

To get all the main config files:

```bash
# Clone this repo
git clone --depth=1 "https://github.com/nipun-ghanathe/dotfiles.git" "$HOME/dotfiles"

# cd into the repo and stow
cd "$HOME/dotfiles"
stow .

# create symlinks for theme
ln -snf "$HOME/dotfiles/themes/catppuccin" "$HOME/.config/theme"
ln -snf "$HOME/.config/theme/neovim.lua" "$HOME/dotfiles/.config/nvim/lua/plugins/colors.lua"
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

## Neovim Setup

You can run all the following commands without opening Neovim by using
something like:

```bash
nvim --headless -c "MasonInstall lsp1 lsp2..." -c qall
```

Install treesitter parsers

```
:TSInstall python c cpp lua rust go bash html css javascript typescript vim vimdoc gitignore markdown json yaml toml
```

Install LSPs via Mason

```
:MasonInstall pyright typescript-language-server html-lsp css-lsp lua-language-server
```

Install formatters via Mason

```
:MasonInstall ruff prettier stylua
```

Install linters via Mason

```
:MasonInstall ruff mypy
```

Install others like `djlint` when needed.

# Post Install

After doing the above installation and setup, you may still want to do these
manual things:

- Install Obsidian AppImage, move it to `~/apps`, make it executable, and move the `.desktop` and
  `icon.png` file found after `./obsdian.AppImage --appimage-extract` to
  `~/.local/share/applications` and `~/.local/share/icons` respectively.

- Setup rclone by running

```bash
rclone config create gdrive drive
```

- Setup auto drive backup every 3 days

```bash
systemctl --user daemon-reload
systemctl --user enable --now drive_backup.timer
```

# TODOs

- [ ] Use a single theme for most things (waybar, mako, rofi, ...) and keep your theme switcher minimal (maybe just terminal and editor)
- [ ] Make a way to automate the setup - script / ISO
