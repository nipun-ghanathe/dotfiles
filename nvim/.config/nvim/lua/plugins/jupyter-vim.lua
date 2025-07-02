return {
  "jupyter-vim/jupyter-vim",
  config = function()
    vim.g.jupyter_mapkeys = 0
    vim.keymap.set('n', '<leader>C', '<cmd>JupyterConnect<cr>')
    vim.keymap.set('n', '<leader>R', '<cmd>JupyterRunFile<cr>')
    vim.keymap.set('n', '<leader>D', '<cmd>JupyterCd %:p:h<cr>')
    vim.keymap.set('n', '<leader>SC', '<cmd>JupyterSendCell<cr>')
    vim.keymap.set('n', '<leader>SR', '<cmd>JupyterSendRange<cr>')
  end,
}
