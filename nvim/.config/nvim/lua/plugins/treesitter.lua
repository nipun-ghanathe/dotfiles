return {
    {
        "nvim-treesitter/nvim-treesitter",
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
        },
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { 
                    "lua", "python", "c", "cpp",
                    "html", "css", "javascript",
                    "vim", "markdown",
                },
                auto_install = true,
            }
            vim.wo.foldmethod = 'expr'
            vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
            vim.o.foldlevel = 99
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true
        end,
    },
}
