return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavours = "moccha",
      transparent_background = false,
      term_colors = true,
      dim_inactive = {
        enable = true,
        shade = "dark",
        percentage = 0.5,
      },
      default_integrations = true,
      auto_integrations = true,
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
