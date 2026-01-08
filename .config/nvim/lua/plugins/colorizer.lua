return {
  "catgoose/nvim-colorizer.lua",
  -- ft = { "css", "html" },
  keys = {
    {
      "<localleader>ct",
      "<cmd>ColorizerToggle<cr>",
      ft = { "css", "html" },
      desc = "Toggle Colorizer",
    },
  },
  opts = {
    lazy_load = true,
    filetypes = {
      "css",
      "html",
    },
    user_default_options = {
      css = true,
      -- -- Tailwind colors.  boolean|'normal'|'lsp'|'both'.  True sets to 'normal'
      -- tailwind = false, -- Enable tailwind colors
      -- tailwind_opts = { -- Options for highlighting tailwind names
      --   update_names = false, -- When using tailwind = 'both', update tailwind names from LSP results.  See tailwind section
      -- },
    },
  },
}
