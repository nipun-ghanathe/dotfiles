return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
        config = function()
            vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files)
            vim.keymap.set('n', '<leader>lg', require('telescope.builtin').live_grep)
            vim.keymap.set('n', '<leader>sg', require('telescope.builtin').git_files)
            vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers)
            vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics)
            vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags)
            vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps)
        end,
    },
}
