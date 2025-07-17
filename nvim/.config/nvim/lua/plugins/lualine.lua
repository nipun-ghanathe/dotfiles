return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local custom_nord = require("lualine.themes.nord")
    custom_nord.normal.a.bg = "#81a1c1"
    require("lualine").setup({
      options = { theme = custom_nord },
    })
  end,
}
