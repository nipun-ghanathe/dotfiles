return {
  "iamcco/markdown-preview.nvim",
  build = "cd app && npm install && rm -f package-lock.json && git restore .",
  ft = "markdown",
  init = function()
    vim.g.mkdp_theme = "dark" -- set default theme to dark
  end,
  config = function()
    vim.keymap.set(
      "n",
      "<localleader>mp",
      "<cmd>MarkdownPreviewToggle<cr>",
      { desc = "Toggle Markdown Preview", buffer = true }
    )
  end,
}
