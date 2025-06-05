return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "mason-org/mason.nvim", version = "^1.0.0" },
    { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
  },

  config = function()
    require("mason").setup()

    -- Defining variable capabilities for later use
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    require("mason-lspconfig").setup({
      auto_install = true,
      ensure_installed = {
        "lua_ls", "pyright", "clangd",
        "html", "cssls", "eslint",
      },
    })

    -- Setting up the LSP servers
    local lspconfig = require('lspconfig')
    lspconfig.lua_ls.setup({ capabilities = capabilities })
    lspconfig.pyright.setup({
      capabilities = capabilities,
      settings = {
        python = {
          analysis = {
            diagnosticSeverityOverrides = {
              reportAttributeAccessIssue = "none",
              reportMissingImports = "none",
            },
          },
        },
      },
    })
    lspconfig.clangd.setup({ capabilities = capabilities })
    lspconfig.html.setup({ capabilities = capabilities })
    lspconfig.cssls.setup({ capabilities = capabilities })
    lspconfig.eslint.setup({ capabilities = capabilities })

    -- local hover = vim.lsp.buf.hover
    -- ---@diagnostic disable-next-line: duplicate-set-field
    -- vim.lsp.buf.hover = function()
      --     return hover({
        --         max_width = 100,
        --         max_height = 14,
        --         border = "rounded",
        --     })
        -- end
        --
        -- local open_float = vim.diagnostic.open_float
        -- ---@diagnostic disable-next-line: duplicate-set-field
        -- vim.diagnostic.open_float = function(opts)
          --     opts = opts or {}
          --     opts.border = opts.border or "rounded"
          --     return open_float(opts)
          -- end

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover,
      { border = "rounded", max_width = 100, max_height = 14 }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help,
      { border = "rounded" }
    )
  end,
}
