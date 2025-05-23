return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      window = { width = 30 },
      filesystem = { hijack_netrw_behaviour = "disabled" }
    })

    vim.keymap.set('n', '<leader>.', '<cmd>Neotree toggle<cr>')
    vim.keymap.set('n', '<leader>gs', '<cmd>Neotree source=git_status reveal position=float toggle<cr>')
    vim.keymap.set('n', '<leader>bl', '<cmd>Neotree source=buffers reveal position=float toggle<cr>')
  end,
}
