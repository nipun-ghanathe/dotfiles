return {
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { 
                    "lua", "python", "c", "cpp",
                    "html", "css", "javascript",
                    "vim", "markdown",
                },
                auto_install = true
            }
        end
    }
}
