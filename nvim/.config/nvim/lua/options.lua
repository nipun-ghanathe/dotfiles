-- Line number
vim.opt.number = true
vim.opt.relativenumber = true

-- Cursor Line (only for number)
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- Configuring indentation and tabs
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.expandtab = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Changing tab length based on filetype
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "python", "java", "rust", "c", "cpp", "json" },
    callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.shiftwidth = 4
    end,
})

-- Keeping the cursor in place
vim.opt.scrolloff = 8

-- Configuring search
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

-- Uncomment this for auto save
-- vim.opt.autowrite = true
-- vim.opt.autowriteall = true
-- Enabling autoread changes
vim.opt.autoread = true

-- Enabling color column
vim.opt.colorcolumn = "80"

-- Disabling word wrap
vim.opt.wrap = false

-- Enabling mouse
vim.opt.mouse = 'a'

-- Decreasing update time and mapped sequence wait time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 500

-- Enabling sign column
vim.opt.signcolumn = 'yes'

-- Making splits more natural
-- vim.opt.splitbelow = true
vim.opt.splitright = true

-- Setting undodir for persistent undo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('cache') .. "undodir"

-- Enabling termguicolors
vim.opt.termguicolors = true

-- Use these to make the background transparent (if it doesn't happen by default)
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- Configuring netrw
vim.g.netrw_banner = 0

-- Configuring folds
vim.opt.fillchars = {
  foldopen = "▾",
  foldclose = "▸",
  fold = " ",
  foldsep = " ",
}
vim.opt.foldcolumn = '0'
vim.opt.foldlevel = 99
vim.opt.foldmethod = "indent"
-- run `:set foldcolumn=1` to see the fold column
-- use `za` to toggle fold under cursor
-- use `zM` to open all folds
-- use `zR` to close all folds

-- Better diagnostic symbols
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = '',
      [vim.diagnostic.severity.HINT] = '󰌵',
    },
  }
})
