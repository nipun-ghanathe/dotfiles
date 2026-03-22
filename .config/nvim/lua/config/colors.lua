vim.pack.add({ 'https://github.com/ellisonleao/gruvbox.nvim' })

require('gruvbox').setup({
  bold = false,
  italic = { strings = false },
  overrides = {
    SignColumn = { bg = 'NONE' },
    DiagnosticSignError = { link = 'DiagnosticError' },
    DiagnosticSignWarn = { link = 'DiagnosticWarn' },
    DiagnosticSignInfo = { link = 'DiagnosticInfo' },
    DiagnosticSignHint = { link = 'DiagnosticHint' },
    DiagnosticSignOk = { link = 'DiagnosticOk' },
  },
})

vim.cmd.colorscheme('gruvbox')
