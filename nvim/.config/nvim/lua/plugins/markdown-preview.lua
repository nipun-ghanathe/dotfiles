return {
  "iamcco/markdown-preview.nvim",
  build = "cd app && npm install && rm -f package-lock.json && git restore .",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  keys = {
    { "<localleader>mp", "<cmd>MarkdownPreviewToggle<cr>", ft = "markdown", desc = "Toggle Markdown Preview" },
  },
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
}
