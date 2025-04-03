return {
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        config = function()
            vim.g.mkdp_auto_start = 1
            vim.g.mkdp_auto_close = 0
            vim.g.mkdp_theme = 'light'
            vim.g.mkdp_browser = "/usr/bin/firefox"
        end,
        ft = { "markdown" },
        keys = {
            { '<leader>mp', '<cmd>MarkdownPreviewToggle<cr>', 'n' },
        },
    },
}
