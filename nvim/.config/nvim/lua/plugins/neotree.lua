return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        lazy = false,
        keys = {
            { '<leader>e', '<cmd>Neotree source=filesystem reveal position=current toggle<cr>', 'n' },
            { '<leader>bl', '<cmd>Neotree source=buffers reveal position=float toggle<cr>', 'n' },
            { '<leader>gs', '<cmd>Neotree source=git_status reveal position=float toggle<cr>', 'n' },
            { '<c-n>', '<cmd>Neotree source=filesystem reveal position=left toggle<cr>', 'n' },
        },
        config = function()
            -- Disabling netrw
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            vim.diagnostic.config({
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = '',
                        [vim.diagnostic.severity.WARN] = '',
                        [vim.diagnostic.severity.INFO] = '',
                        [vim.diagnostic.severity.HINT] = '󰌵',
                    },
                }
            })

            require("neo-tree").setup({
                window = {
                    position = "center",
                    width = 30,
                },
                filesystem = {
                    hijack_netrw_behavior = "open_current",
                },
            })
        end,
    },
}
