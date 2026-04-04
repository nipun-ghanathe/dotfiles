local aug = vim.api.nvim_create_augroup('my', { clear = true })

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = aug,
  desc = 'Highlight on yank',
  callback = function()
    vim.hl.on_yank({ higroup = 'Visual', timeout = 200 })
  end,
})

-- Change indentation to two spaces
vim.api.nvim_create_autocmd('FileType', {
  group = aug,
  desc = 'change indentation to two spaces',
  pattern = {
    'javascript',
    'typescript',
    'sql',
    'html',
    'htmldjango',
    'css',
    'markdown',
    'json',
    'yaml',
    'lua',
  },
  callback = function()
    vim.bo.expandtab = true
    vim.bo.shiftwidth = 2
  end,
})

-- Remove trailing spaces
vim.api.nvim_create_autocmd('BufWritePre', {
  group = aug,
  desc = 'remove trailing spaces',
  callback = function()
    local view = vim.fn.winsaveview()
    vim.cmd([[silent! keepjumps keeppatterns %s/\s\+$//e]])
    vim.fn.winrestview(view)
  end,
})

-- Remove 'fuzzy' from 'cot' for certain filetypes
vim.api.nvim_create_autocmd('FileType', {
  group = aug,
  desc = "Remove 'fuzzy' from 'cot' for certain filetypes",
  pattern = { 'html', 'css' },
  callback = function()
    vim.opt_local.completeopt:remove({ 'fuzzy' })
  end,
})
