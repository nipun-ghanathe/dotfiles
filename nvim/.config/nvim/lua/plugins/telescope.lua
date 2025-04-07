return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
        keys = {
            { '<leader>sf', require('telescope.builtin').find_files,  'n' },
            { '<leader>sg', require('telescope.builtin').live_grep,   'n' },
            { '<c-p>',      require('telescope.builtin').git_files,   'n' },
            { '<leader>sb', require('telescope.builtin').buffers,     'n' },
            { '<leader>sd', require('telescope.builtin').diagnostics, 'n' },
            { '<leader>sh', require('telescope.builtin').help_tags,   'n' },
            { '<leader>sk', require('telescope.builtin').keymaps,     'n' },
        },
    },
}
