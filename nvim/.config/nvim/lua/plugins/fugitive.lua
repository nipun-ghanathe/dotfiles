return {
  "tpope/vim-fugitive",
  config = function()
    -- keymaps and other things to be added
    vim.keymap.set('n', '<leader>g', '<cmd>G<cr>')
  end,
}
