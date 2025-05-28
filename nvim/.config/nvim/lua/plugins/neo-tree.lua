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
      event_handlers = {
        {
          event = "neo_tree_window_after_open",
          handler = function(args)
            vim.wo[args.winid].colorcolumn = ""
            vim.wo[args.winid].signcolumn = "no"
          end,
        }
      },
      close_if_last_window = true,
      window = { width = 30 },
      filesystem = {
        hijack_netrw_behavior = "open_current",
        follow_current_file = { enabled = true },
      },
    })

    vim.keymap.set('n', '<leader>.', '<cmd>Neotree toggle<cr>')
    vim.keymap.set('n', '<leader>e', '<cmd>Neotree current  toggle<cr>')
    vim.keymap.set('n', '<leader>gs', '<cmd>Neotree source=git_status reveal position=float toggle<cr>')
    vim.keymap.set('n', '<leader>bl', '<cmd>Neotree source=buffers reveal position=float toggle<cr>')
  end,
}
