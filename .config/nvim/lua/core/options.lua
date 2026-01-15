-- Appearance
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.list = true
vim.opt.listchars = {}
vim.opt.winborder = "rounded"
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.guicursor:append("ci:block")

-- Indentation and tabs
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Change tab length based on filetype
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("user_cmds_tabstop", { clear = true }),
  desc = "four space indenting",
  pattern = { "python", "c", "cpp", "java", "rust", "php" },
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
    vim.bo.shiftwidth = 4
  end,
})

-- Behaviour
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.confirm = true
vim.opt.completeopt = { "menu", "menuone", "noinsert", "fuzzy", "popup" }
vim.opt.timeoutlen = 500 -- Decreasing mapped sequence wait time
vim.opt.undofile = true -- Setting persistent undo

-- Netrw
-- vim.g.netrw_liststyle = 3 -- tree list style
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 30
vim.g.netrw_localcopydircmd = "cp -r"
vim.api.nvim_set_hl(0, "netrwMarkFile", { link = "Search" })

-- Folds
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
