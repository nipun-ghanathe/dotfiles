### Bootstraping the setup

To bootstrap the setup run:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/nipun-ghanathe/dotfiles/refs/heads/main/setup/main.sh)
```

You will find log file at `/tmp/dotfiles-setup.log`.

### Post-install

1. Authenticate GithubCLI with `gh auth login`.
1. Configure [rclone](https://github.com/nipun-ghanathe/dotfiles/tree/main/rclone#configuration)
1. Others apps you may wish to install:
   - AppImageLauncher
   - Obsidian

### 📝 To-dos

- [ ] Improve your setup bash scripts by taking inspiration from Omarchy and Omakub
- [ ] Try using `vim.fn.chansend` instead of `vim-slime` for interactive-programming.
  Refer to this video on [Neovim terminal by TJDevries](https://youtu.be/ooTcnx066Do?t=440)
  You may write your own custom plugin - a lua upgrade of vim-slime.
- [ ] Update Neovim config after release of v0.12 or later to:
  - [ ] Use native package manager
  - [ ] Use native completion and snippet management
  - [x] Use native LSP
