return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        lua = { "stylua" },
        python = {
          "ruff_format",
          "ruff_organize_imports",
        },
        htmldjango = { "djlint" },
        html = { "djlint" },
        markdown = { "mdformat" },
      },
    })

    vim.keymap.set("n", "<leader>fc", function()
      require("conform").format()
    end, { desc = "Format file using Conform" })
  end,
}
