return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        -- lua = { "stylua" }, -- use lsp instead
        -- python = { "black", "isort" },
        python = {
          -- To fix auto-fixable lint errors
          -- "ruff_fix",
          -- To run the ruff formatter
          "ruff_format",
          -- To organize the imports
          "ruff_organize_imports",
        },
        rust = { "rustfmt" },
        javascript = { "prettier" },
        c = { "clang-format" },
        cpp = { "clang-format" },
      },
    })

    vim.keymap.set("n", "<leader>f", function()
      require("conform").format()
    end, { desc = "Format file using Conform" })
  end,
}
