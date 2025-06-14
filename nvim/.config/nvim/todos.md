***Changes will be done in June of 2026***

- [ ] debloat the config if possible

- [ ] replace `nvim-lspconfig` by `vim.lsp`  
  example:
  ```
  vim.lsp.config('ruff', {
    init_options = {
      settings = {
        -- Ruff language server settings go here
      }
    }
  })
  
  vim.lsp.enable('ruff')
  ```

- [ ] remove `mason` and install lsps, formatters and linters globally

- [ ] if you have done proper setup for all the common languages then
  you might remove `none-ls`, `conform` and `nvim-lint` as you
  might not be using them

- [ ] see if you can remove `venv-selector`

- [ ] rewrite the whole config
