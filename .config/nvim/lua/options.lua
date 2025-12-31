-- Line number
vim.opt.number = true
vim.opt.relativenumber = true

-- Cursor Line (only for number)
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- Block cursor in insert mode and command-line insert mode
-- vim.opt.guicursor:append("i-ci:block")
vim.opt.guicursor:append("ci:block")

-- Configuring indentation and tabs
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.expandtab = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Changing tab length based on filetype
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("user_cmds_tabstop", { clear = true }),
  desc = "two space indenting",
  pattern = {
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "css",
    "lua",
    "sh",
    "bash",
    "zsh",
    "markdown",
    "ruby",
    "yaml",
    "json",
    "jsonc",
  },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

-- Visibility of invisible characters
vim.opt.list = true
vim.opt.listchars = {}

-- Configuring search
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

-- Better Splits
-- vim.opt.splitbelow = true
-- vim.opt.splitright = true

-- Configuring completion menu
vim.opt.completeopt = { "menu", "menuone", "noinsert" }

-- Uncomment this for auto save
-- vim.opt.autowrite = true
-- vim.opt.autowriteall = true
-- Enabling autoread changes
vim.opt.autoread = true

-- Enabling termguicolors
vim.opt.termguicolors = true

-- Enabling color column
vim.opt.colorcolumn = "80"

-- Enabling sign column
vim.opt.signcolumn = "yes"

-- Always show tab line
vim.opt.showtabline = 2

-- Disabling word wrap
vim.opt.wrap = false

-- Enabling mouse
vim.opt.mouse = "a"

-- Decreasing update time and mapped sequence wait time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 500

-- Setting undodir for persistent undo
vim.opt.undofile = true

-- Configuring netrw
-- vim.g.netrw_liststyle = 3 -- tree list style
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 30
vim.api.nvim_set_hl(0, "netrwMarkFile", { link = "Search" })
vim.g.netrw_localcopydircmd = "cp -r"

-- Configuring folds
vim.opt.foldenable = false
vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
}
vim.opt.foldmethod = "indent"
vim.opt.foldtext = [[v:lua.MyFoldText()]]
function _G.MyFoldText()
  local fs, fe = vim.v.foldstart, vim.v.foldend
  local num_lines = fe - fs + 1
  return vim.fn.getline(fs) .. "  "
  -- return vim.fn.getline(fs) .. "  --- " .. num_lines .. " lines"
end
-- For configuring hi-groups for Folded use this `after` setting colorscheme
-- vim.cmd([[hi Folded guibg=NONE guifg=NONE]])
