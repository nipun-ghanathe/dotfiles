-- Appearance
vim.o.number = true
vim.o.relativenumber = true
vim.o.colorcolumn = "80"
vim.o.signcolumn = "yes"
vim.o.wrap = false
vim.o.list = true
vim.opt.listchars = { tab = "> " }
vim.o.winborder = "single"
vim.o.cursorline = true
vim.o.cursorlineopt = "number"
vim.opt.guicursor:append("i-ci:block")

-- Behaviour
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.foldenable = false
vim.o.exrc = true
vim.o.confirm = true
vim.o.timeoutlen = 500 -- Decreasing mapped sequence wait time
vim.o.swapfile = false -- Disable swapfile creation
vim.o.undofile = true -- Setting persistent undo
