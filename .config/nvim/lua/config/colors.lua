local theme_file = vim.fn.stdpath("data") .. "/theme.txt"
local theme_name = vim.fn.filereadable(theme_file) == 1 and vim.fn.readfile(theme_file)[1] or "default"

-- Add themes
vim.pack.add({
  "https://github.com/folke/tokyonight.nvim",
  "https://github.com/navarasu/onedark.nvim",
  "https://github.com/ellisonleao/gruvbox.nvim",
  "https://github.com/shaunsingh/nord.nvim",
  "https://github.com/Mofiqul/dracula.nvim",
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
  { src = "https://github.com/rose-pine/neovim", name = "rose-pine" },
})

-- Configure themes
require("dracula").setup({ italic_comment = true })
require("catppuccin").setup({ term_colors = true })
require("rose-pine").setup({
  highlight_groups = {
    StatusLineTerm = { link = "StatusLine" },
    StatusLineTermNC = { link = "StatusLineNC" },
  },
})

-- Load theme
vim.cmd.colorscheme(theme_name)

-- Autocmd to write theme name to theme file whenever colorscheme is changed
vim.api.nvim_create_autocmd({ "ColorScheme" }, {
  desc = "write colorscheme name to stdpath(data)/theme.txt",
  callback = function()
    vim.fn.writefile({ vim.g.colors_name }, theme_file)
  end,
})
