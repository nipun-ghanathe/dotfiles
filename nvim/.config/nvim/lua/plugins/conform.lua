return {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  dependencies = {
    "zapling/mason-conform.nvim",
  },

  config = function()
    require("conform").setup({
      formatters_by_ft = {
        python = { "isort", "black" }, -- formatters run in sequence from left to right
        -- python = { "ruff" }, -- ruff as a formatter will remove certain things without even asking for confirmation
        c = { "clang-format" },
        cpp = { "clang-format" },
        javascript = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
      },
      notify_on_error = true,
      notify_no_formatters = true,
    })

    vim.keymap.set('n', '<leader>f', function() require('conform').format() end)

    require("mason-conform").setup({
      ensure_installed = {
        'isort', 'black', 'ruff',
        'clang-format', 'prettier',
      }
    })
  end,
}
