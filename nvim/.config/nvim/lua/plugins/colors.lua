return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "dark",
        transparent = false,
        term_colors = true,
      })
      require("onedark").load()
    end,
  },
}

-- for transparency (excluding some elements like statusline, tabline, etc)
-- vim.cmd([[
--   hi Normal guibg=NONE ctermbg=NONE
--   hi NormalNC guibg=NONE ctermbg=NONE
--   hi SignColumn guibg=NONE
--   hi EndOfBuffer guibg=NONE
-- ]])
