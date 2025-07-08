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
        },
        {
          event = "file_opened",
          handler = function(file_path)
            -- autoclose neo-tree
            require("neo-tree.command").execute({ action = "close" })
          end,
        },
      },

      close_if_last_window = true,
      window = {
        position = "bottom",
        width = 30,
      },
      filesystem = {
        filtered_items = {
          hide_by_name = {
            "__pycache__",
          },
        },
        follow_current_file = { enabled = true },
        hijack_netrw_behavior = "open_default",
      },
    })

    vim.keymap.set('n', '<leader>.', '<cmd>Neotree toggle<cr>', { desc = "Toggle Neotree" })
    vim.keymap.set('n', '<leader>e', '<cmd>Neotree current toggle<cr>', { desc = "Toggle Neotree Current" })
  end,
}
