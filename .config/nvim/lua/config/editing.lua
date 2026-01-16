----------------
--- Surround ---
----------------

vim.pack.add({ "https://github.com/kylechui/nvim-surround" })
require("nvim-surround").setup()

-----------------
--- Autopairs ---
-----------------

vim.pack.add({
  "https://github.com/windwp/nvim-autopairs",
  "https://github.com/windwp/nvim-ts-autotag",
})
require("nvim-autopairs").setup()
