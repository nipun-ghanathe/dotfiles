vim.pack.add({
  "https://github.com/kristijanhusak/vim-dadbod-ui",
  "https://github.com/tpope/vim-dadbod",
  "https://github.com/kristijanhusak/vim-dadbod-completion",
  "https://github.com/hrsh7th/nvim-cmp",
})

-- Configuration
vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_execute_on_save = 0

-- Customize keymaps
vim.keymap.set("n", "<c-cr>", "<Plug>(DBUI_ExecuteQuery)")
vim.keymap.set("n", "<c-s-cr>", "vip<Plug>(DBUI_ExecuteQuery)")

-- nvim-cmp integration
require("cmp").setup.filetype({ "sql" }, {
  sources = {
    { name = "vim-dadbod-completion" },
    { name = "path" },
    { name = "buffer" },
  },
})
