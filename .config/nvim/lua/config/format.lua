vim.pack.add({ 'https://github.com/stevearc/conform.nvim' })

require('conform').setup({
  formatters = {
    prettier = {
      append_args = { '--config-precedence=prefer-file', '--no-semi', '--single-quote' },
    },
  },
  formatters_by_ft = {
    python = { 'ruff_format', 'ruff_organize_imports' },
    html = { 'prettier' },
    css = { 'prettier' },
    javascript = { 'prettier' },
    typescript = { 'prettier' },
    javascriptreact = { 'prettier' },
    typescriptreact = { 'prettier' },
  },
  default_format_opts = { timeout_ms = 2000, lsp_format = 'fallback' },
  -- format_on_save = function(bufnr)
  --   if
  --     vim.b[bufnr].formatonsave ~= true
  --     and (vim.b.formatonsave ~= nil or not vim.g.formatonsave)
  --   then
  --     return
  --   end
  --   return { timeout_ms = 500, lsp_format = 'fallback' }
  -- end,
})

-- -- usercmd to toggle format_on_save
-- vim.api.nvim_create_user_command('FormatOnSaveToggle', function(opts)
--   local var = opts.bang and vim.b or vim.g
--   var.formatonsave = var.formatonsave ~= true
--   vim.notify(
--     string.format(
--       'format on save -> global: %s | buffer: %s',
--       vim.g.formatonsave,
--       vim.b.formatonsave == nil and 'inherit' or vim.b.formatonsave
--     ),
--     vim.log.levels.INFO
--   )
-- end, { bang = true })

-- keymap to format
vim.keymap.set({ 'n', 'v' }, '<leader>gw', require('conform').format, { desc = 'Conform: Format File' })
