return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set('n', '<leader>gs', function()
      if vim.bo.filetype == "fugitive" then
        vim.cmd('q')
      else
        vim.cmd('Git')
      end
    end, { desc = "Open Fugitive window - Git Status" })
  end,
}
