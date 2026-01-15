vim.keymap.set("o", "ir", "i]")
vim.keymap.set("o", "ar", "a]")

return {
  "kylechui/nvim-surround",
  version = "*",
  event = { "BufReadPost", "BufNewFile" },
  opts = {},
}
