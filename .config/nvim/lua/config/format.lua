vim.g.formatonsave = false

vim.g.format_config = {
  formatter_cmds = {
    prettier = function(fname)
      return {
        'prettier',
        '--config-precedence=prefer-file',
        '--no-semi',
        '--single-quote',
        '--stdin-filepath',
        fname,
      }
    end,
  },
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
