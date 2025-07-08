return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  config = function()
    require("telescope").setup({
      pickers = {
        buffers = {
          sort_mru = true,
          ignore_current_buffer = true,
          mappings = {
            i = {
              ["<c-d>"] = "delete_buffer"
            },
            n = {
              ["d"] = "delete_buffer"
            },
          },
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown()
        },
      },
    })
    require("telescope").load_extension("ui-select")

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<c-p>', builtin.find_files, { desc = 'Telescope: Project files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope: Find Grep' })
    vim.keymap.set('n', '<leader>bl', builtin.buffers, { desc = 'Telescope: Buffers List' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope: Find Help' })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Telescope: Find Keymaps' })
  end,
}
