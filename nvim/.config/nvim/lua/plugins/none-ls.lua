return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.diagnostics.pylint.with({
          extra_args = (function()
            local disabled = {
              "missing-docstring",
              "missing-module-docstring",
              "invalid-name",
              "too-few-public-methods",
              "import-error",
              "unspecified-encoding",
            }
            return { "--disable=" .. table.concat(disabled, ",")}
          end)(),
        }),
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.diagnostics.cppcheck,
        null_ls.builtins.formatting.erb_lint,
      },
    })

    -- vim.keymap.set('n', '<leader>f', "<cmd>lua vim.lsp.buf.format()<cr>") -- already added in lsp mappings
  end,
}
