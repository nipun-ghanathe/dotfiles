vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim" })

require("lualine").setup({
  sections = {
    lualine_c = { "%f %h%w%m%r" },
  },
  options = {
    component_separators = "|",
    section_separators = "",
  },
})
