-- Appearance
vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.colorcolumn = "80"
vim.o.signcolumn = "yes"
vim.o.wrap = false
vim.o.list = true
vim.opt.listchars = {}
vim.o.winborder = "rounded"
vim.o.cursorline = true
vim.o.cursorlineopt = "number"
vim.opt.guicursor:append("ci:block")

-- Indentation and tabs
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

-- Change tab length based on filetype
vim.api.nvim_create_autocmd("FileType", {
  desc = "four space indenting",
  pattern = { "python", "c", "cpp", "java", "rust", "php" },
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
    vim.bo.shiftwidth = 4
  end,
})

-- Behaviour
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.confirm = true
vim.opt.completeopt = { "menu", "menuone", "noinsert", "fuzzy", "popup" }
vim.o.timeoutlen = 500 -- Decreasing mapped sequence wait time
vim.o.undofile = true -- Setting persistent undo

-- Netrw
-- vim.g.netrw_liststyle = 3 -- tree list style
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 30
vim.g.netrw_localcopydircmd = "cp -r"
vim.api.nvim_set_hl(0, "netrwMarkFile", { link = "Search" })

-- Folds
vim.o.foldenable = false
vim.o.foldcolumn = "0"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldmethod = "indent"
vim.o.foldtext = [[v:lua.MyFoldText()]]
function _G.MyFoldText()
  local fs, fe = vim.v.foldstart, vim.v.foldend
  local num_lines = fe - fs + 1
  return vim.fn.getline(fs) .. "  "
  -- return vim.fn.getline(fs) .. "  --- " .. num_lines .. " lines"
end
-- For configuring hi-groups for Folded use this `after` setting colorscheme
-- vim.cmd([[hi Folded guibg=NONE guifg=NONE]])
