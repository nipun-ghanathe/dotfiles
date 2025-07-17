return {
  "MeanderingProgrammer/render-markdown.nvim",
  after = { "nvim-treesitter" },
  requires = { "nvim-tree/nvim-web-devicons", opt = true },
  ft = { "markdown" },
  config = function()
    require("render-markdown").setup({
      enabled = false,
      code = { border = "thick" },
    })

    vim.keymap.set("n", "<localleader>mt", "<cmd>RenderMarkdown toggle<cr>", { desc = "RenderMarkdown toggle" })
  end,
}
