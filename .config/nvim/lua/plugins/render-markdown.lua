return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = "markdown",
  keys = {
    { "<localleader>mr", "<cmd>RenderMarkdown toggle<cr>", desc = "Markdown Render" },
    { "<localleader>mrp", "<cmd>RenderMarkdown preview<cr>", desc = "Markdown Render - Preview" },
  },
  -- dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@diagnostic disable-next-line: undefined-doc-name
  ---@type render.md.UserConfig
  opts = {
    enabled = false,
    completions = {
      lsp = { enabled = true },
    },
  },
}
