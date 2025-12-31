This repo stores all my configuration files.\
Multiple themes are available.

# Usage

*(After installing all required packages - see next section for installation)*

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
:MasonInstall ruff prettier stylua mdformat
```

Install linters via Mason

```
:MasonInstall ruff mypy
```

Install others like `djlint` when needed.

# TODOs

- [ ] Make a way to automate the setup - script / ISO
