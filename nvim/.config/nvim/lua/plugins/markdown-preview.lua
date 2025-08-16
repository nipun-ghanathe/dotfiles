return {
  "iamcco/markdown-preview.nvim",
  build = "cd app && npm install && rm -f package-lock.json && git restore .",
  ft = "markdown",
  init = function()
    -- open preview in new window
    vim.cmd([[
      function OpenMarkdownPreview (url)
        execute "silent ! firefox --new-window " . a:url
      endfunction
      let g:mkdp_browserfunc = 'OpenMarkdownPreview'
    ]])

    -- set the default theme to dark
    vim.g.mkdp_theme = "dark"
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
