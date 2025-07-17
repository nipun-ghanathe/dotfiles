return {
  "mbbill/undotree",
  config = function()
    vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr><c-w>w", { desc = "Toggle Undo Tree" })
  end,
}
