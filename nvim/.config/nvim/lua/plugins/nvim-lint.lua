return {
  "mfussenegger/nvim-lint",
  config = function()
    require("lint").linters_by_ft = {
      -- python = { "ruff" },  -- use the lsp instead so you can also get code-actions
      python = { "mypy" }, -- for type checking (note that mypy works only on save)
      javascript = { "eslint_d" },
      c = { "cpplint" },
      cpp = { "cpplint" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
