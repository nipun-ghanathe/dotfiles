local augroup = vim.api.nvim_create_augroup('user_cmds', { clear = true })

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = augroup,
  desc = 'Highlight on yank',
  callback = function(event)
    vim.highlight.on_yank({ higroup = 'Visual', timeout = 200 })
  end
})

-- If filetype is `help` or `man` then `q` to close the window
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'help', 'man' },
  group = augroup,
  desc = 'Use q to close the window',
  command = 'nnoremap <buffer> q <cmd>quit<cr>'
})

-- Viewing spaces as dots in visual mode
vim.opt.list = true
vim.opt.listchars = {}
vim.api.nvim_create_autocmd({"ModeChanged"}, {
  group = augroup,
  pattern = {"*:[vV\x16]"},  -- Entering visual mode (Normal to Visual)
  callback = function()
    vim.opt.listchars:append("space:·")
  end
})
vim.api.nvim_create_autocmd({"ModeChanged"}, {
  group = augroup,
  pattern = {"[vV\x16]:*"},  -- Exiting visual mode (Visual to Normal)
  callback = function()
    vim.opt.listchars = {}
  end
})
