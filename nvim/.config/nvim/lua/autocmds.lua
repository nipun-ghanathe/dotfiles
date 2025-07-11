local augroup = vim.api.nvim_create_augroup('user_cmds', { clear = true })

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = augroup,
  desc = 'Highlight on yank',
  callback = function(event)
    vim.highlight.on_yank({ higroup = 'Visual', timeout = 200 })
  end
})

-- Automatic line wrapping (breaking) in markdown files
-- Note: you can use `gq` command to wrap text that was not wrapped (even in non-markdown files)
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "markdown" },
  callback = function()
    vim.opt_local.textwidth = 72
    vim.opt_local.formatoptions:append("t")
  end,
})

-- Viewing spaces as dots in visual mode
vim.opt.list = true
vim.opt.listchars = {}
vim.api.nvim_create_autocmd({ "ModeChanged" }, {
  group = augroup,
  pattern = { "*:[vV\x16]" }, -- Entering visual mode (Normal to Visual)
  callback = function()
    vim.opt.listchars:append("space:·")
  end
})
vim.api.nvim_create_autocmd({ "ModeChanged" }, {
  group = augroup,
  pattern = { "[vV\x16]:*" }, -- Exiting visual mode (Visual to Normal)
  callback = function()
    vim.opt.listchars = {}
  end
})

-- When entering a terminal enter in insert mode
vim.api.nvim_create_autocmd("TermOpen", {
  group = augroup,
  pattern = "*",
  callback = function()
    vim.cmd("startinsert")
  end,
})
