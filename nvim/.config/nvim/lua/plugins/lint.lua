return {
  'mfussenegger/nvim-lint',
  event = "VeryLazy",
  dependencies = {
    'rshkarin/mason-nvim-lint',
  },

  config = function()
    -- set linters by file type
    require('lint').linters_by_ft = {
      -- python = { 'ruff' }, -- I think that the lsp's linting is better compatible with neovim
      javascript = { 'eslint_d' },
    }

    vim.api.nvim_create_autocmd({ "InsertLeave", "BufEnter", "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
        vim.diagnostic.enable(true, { bufnr = 0 })
      end,
    })

    vim.api.nvim_create_autocmd({ "InsertEnter" }, {
      callback = function()
        vim.diagnostic.enable(false, { bufnr = 0 })
      end,
    })

    require('mason-nvim-lint').setup({
      ensure_installed = {
        'ruff', 'eslint_d',
      },
    })
  end,
}
