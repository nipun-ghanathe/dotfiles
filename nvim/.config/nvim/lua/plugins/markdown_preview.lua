return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  -- build = "cd app && npx --yes yarn install",
  build = "cd app && npm install && rm -f package-lock.json && git restore .",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
  config = function()
    vim.keymap.set('n', '<leader>mp', '<cmd>MarkdownPreviewToggle<cr>')
  end,
}
