return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    config = function()
      vim.keymap.set('n', '<leader>pt', '<cmd>MarkdownPreviewToggle<cr>') -- markdown [p]review [t]oggle

      vim.api.nvim_create_autocmd('FileType', {
        pattern = "markdown",
        callback = function()
          vim.cmd("MarkdownPreview")
        end,
      })
    end,
  },
}
