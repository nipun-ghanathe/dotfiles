return {
    --[[ Note:
            To set the background to transparent use:
                vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
                vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    --]]
    
    -- -- Catppuccin
    -- {
    --     "catppuccin/nvim",
    --     name = "catppuccin",
    --     priority = 1000,
    --     config = function()
    --         require("catppuccin").setup({
    --             flavour = "macchiato", -- options are: frappe, latte, macchiato, mocha
    --         })
    --         -- Uncomment this to set as default colorscheme
    --         -- vim.cmd.colorscheme("catppuccin")
    --         -- Uncomment this to make background transparent
    --         -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    --         -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    --     end,
    -- },

    -- -- Tokyonight
    -- {
    --     "folke/tokyonight.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         -- vim.cmd.colorscheme("tokyonight-storm") -- options are: day, moon, night, storm
    --         -- Uncomment this to make background transparent
    --         -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    --         -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    --     end,
    -- },

    {
        "Mofiqul/dracula.nvim",
        config = function()
            vim.cmd.colorscheme("dracula")
            -- Uncomment this to make background transparent
            -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
            require('dracula').setup({
                transparent_bg = true,
                italic_comment = true,
            })
        end,
    },
}
