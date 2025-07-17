return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = {
          "ruff_format",
          "ruff_organize_imports",
        },
        htmldjango = { "djlint" },
        html = { "djlint" },
      },
    })

    vim.keymap.set("n", "<leader>fc", function()
      require("conform").format()
    end, { desc = "Format file using Conform" })
  end,
}
