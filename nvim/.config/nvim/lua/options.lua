-- Line number
vim.opt.number = true
vim.opt.relativenumber = true

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Configuring tabs and indentation
vim.opt.expandtab = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Changing tab length based on filetype
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "lua", "html", "css", "javascript" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.shiftwidth = 2
    end,
})

vim.opt.autoindent = true
vim.opt.smartindent = true

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
vim.opt.timeoutlen = 500 -- consider reducing this to 50 or something when you get comfortable

-- Enabling sign column
vim.opt.signcolumn = 'yes'

-- Making splits more natural
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Enabling termguicolors
vim.opt.termguicolors = true

-- Use these to make the background transparent
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
