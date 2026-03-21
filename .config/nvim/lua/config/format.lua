vim.g.format_config = {
  formatters_by_ft = {
    javascript = 'prettier',
    typescript = 'prettier',
    javascriptreact = 'prettier',
    typescriptreact = 'prettier',
  },
  organize_imports_filetypes = {
    'python',
  },
}

vim.keymap.set('n', '<leader>gw', function()
  require('utils.format').format_file()
end, { desc = 'Format File' })

vim.g.formatonsave = false
