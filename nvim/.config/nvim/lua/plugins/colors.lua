return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  opts = {
    flavour = "macchiato",
    background = {
      light = "latte",
      dark = "macchiato",
    },
    -- for transparency (incluing lualine)
    -- transparent_background = true,
    auto_integrations = true,
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)

    vim.cmd.colorscheme("catppuccin")

    -- for transparency (excluding lualine)
    vim.cmd([[
      hi Normal guibg=NONE ctermbg=NONE
      hi NormalNC guibg=NONE ctermbg=NONE
      hi SignColumn guibg=NONE
      hi EndOfBuffer guibg=NONE
    ]])
  end,
}
