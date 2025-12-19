### Bootstraping the setup

To bootstrap the setup run:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/nipun-ghanathe/dotfiles/refs/heads/main/setup/main.sh)
```

### Post-install

1. Configure [rclone](https://github.com/nipun-ghanathe/dotfiles/tree/main/rclone#configuration)
1. You may want to install some more apps:
   - Obsidian

### 📝 To-dos

- [ ] Improve your setup bash scripts by taking inspiration from Omarchy and Omakub
- [ ] Try using `vim.fn.chansend` instead of `vim-slime` for interactive-programming.
  Refer to this video on [Neovim terminal by TJDevries](https://youtu.be/ooTcnx066Do?t=440)
- [ ] Make your zsh config more minimal. (aim for \<100 ms startup time)
  (you can measure startup time by using `date` command at start and end of zsh config)
- [ ] Update Neovim config after release of v0.12 or later to:
  - [ ] Use native package manager
  - [ ] Use native completion and snippet management
  - [x] Use native LSP
- [ ] Changes in Neovim config
  - [ ] Prevent duplicate snippets
