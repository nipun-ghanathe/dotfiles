vim.pack.add({ 'https://github.com/neovim/nvim-lspconfig' })

-- Enable LSPs
vim.lsp.enable({
  'lua_ls',
  'pyright',
  'ruff',
  'clangd',
  'emmet_language_server',
  'html',
  'cssls',
  'ts_ls',
  'eslint',
})

-- Configure diagnostics
vim.diagnostic.config({
  underline = false,
  virtual_text = false,
  virtual_lines = false,
  severity_sort = false,
  signs = true,
  float = { source = true },
  jump = { float = true },
})

-- LSP mappings and usercmds
local aug = vim.api.nvim_create_augroup('my.lsp', { clear = true })
vim.api.nvim_create_autocmd('LspAttach', {
  group = 'my.lsp',
  desc = 'Set LSP related keymaps and usercmds',
  callback = function(ev)
    -- Close completion menu if visible and view signature help
    vim.keymap.set({ 'i', 's' }, '<c-h>', function()
      vim.lsp.buf.signature_help()
      return vim.fn.pumvisible() ~= 0 and '<c-e>' or ''
    end, { buffer = ev.buf, expr = true, desc = 'Signature Help' })

    -- Toggle (enable/disable) diagnostics
    -- bang then current buffer else global
    vim.api.nvim_buf_create_user_command(ev.buf, 'DiagnosticsToggle', function(opts)
      vim.diagnostic.enable(not vim.diagnostic.is_enabled(), { bufnr = opts.bang and ev.buf or nil })
      vim.notify('diagnotics enabled: ' .. tostring(vim.diagnostic.is_enabled()))
    end, { bang = true, desc = 'Toggle diagnostics' })

    -- Toggle underline in diagnostic.config
    vim.api.nvim_buf_create_user_command(ev.buf, 'DiagnosticsUnderlineToggle', function()
      vim.diagnostic.config({ underline = not vim.diagnostic.config().underline })
      vim.notify('underline diagnostics: ' .. tostring(vim.diagnostic.config().underline))
    end, { desc = 'Toggle underline for diagnostics' })
    vim.keymap.set(
      'n',
      '<localleader>tdu',
      '<cmd>DiagnosticsUnderlineToggle<cr>',
      { desc = 'Toggle Diagnostics Underline' }
    )

    -- Toggle virtual_text in diagnostic.config
    vim.api.nvim_buf_create_user_command(ev.buf, 'DiagnosticsVirtualTextToggle', function()
      vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })
      vim.notify('virtual_text for diagnostics: ' .. tostring(vim.diagnostic.config().virtual_text))
    end, { desc = 'Toggle virtual text for diagnostics' })
    vim.keymap.set(
      'n',
      '<localleader>tdv',
      '<cmd>DiagnosticsVirtualTextToggle<cr>',
      { desc = 'Toggle Diagnostics Virtual Text' }
    )
  end,
})
