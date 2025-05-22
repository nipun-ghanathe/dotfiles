return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files)
      vim.keymap.set('n', '<leader>lg', require('telescope.builtin').live_grep)
      vim.keymap.set('n', '<leader>sg', require('telescope.builtin').git_files)
      vim.keymap.set('n', '<leader>sb', function() require('telescope.builtin').buffers({ initial_mode = "normal" }) end)
      vim.keymap.set('n', '<leader>sd',
        function() require('telescope.builtin').diagnostics({ initial_mode = "normal", bufnr = 0, previewer = false }) end)
      vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags)
      vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps)

      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({ initial_mode = "normal" })
          }
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
