-- Appearance
vim.o.number = true
vim.o.relativenumber = true
vim.o.colorcolumn = "80"
vim.o.signcolumn = "yes"
vim.o.wrap = false
vim.o.list = true
vim.o.winborder = "single"
vim.o.cursorline = true
vim.o.cursorlineopt = "number"
vim.opt.guicursor:append("i-ci:block")

-- Indentation and tabs
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

-- Change tab length based on filetype
vim.api.nvim_create_autocmd("FileType", {
  group = "user_autocmds",
  desc = "four space indenting",
  pattern = { "python", "c", "cpp", "java", "rust", "php", "bash", "sh" },
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
    vim.bo.shiftwidth = 4
  end,
})

-- Behaviour
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.foldenable = false
vim.o.foldmethod = "indent"
vim.o.exrc = true
vim.o.confirm = true
vim.o.timeoutlen = 500 -- Decreasing mapped sequence wait time
vim.o.swapfile = false -- Disable swapfile creation
vim.o.undofile = true -- Setting persistent undo
