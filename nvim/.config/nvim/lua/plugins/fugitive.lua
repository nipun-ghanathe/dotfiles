return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set('n', '<leader>gs', '<cmd>G<cr>', { desc = "Open Fugitive window - Git Status" })
  end,
}
