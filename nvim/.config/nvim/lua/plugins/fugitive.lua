return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set('n', '<leader>g', '<cmd>G<cr>', { desc = "Open Fugitive window" })
  end,
}
