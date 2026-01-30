vim.pack.add({
  { src = "https://github.com/rose-pine/neovim", name = "rose-pine" },
})
require("rose-pine").setup({
  variant = "moon",
  highlight_groups = {
    StatusLineTerm = { link = "StatusLine" },
    StatusLineTermNC = { link = "StatusLineNC" },
  },
})
vim.cmd.colorscheme("rose-pine")
