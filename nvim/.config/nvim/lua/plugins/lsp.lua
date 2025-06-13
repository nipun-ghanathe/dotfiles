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
            typeCheckingMode = "off",
            -- typeCheckingMode = "strict",
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

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover,
      { border = "rounded", max_width = 100, max_height = 14 }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help,
      { border = "rounded" }
    )

    vim.diagnostic.config({ float = { border = "rounded" }})

    ------------------------
    ----- LSP mappings -----
    ------------------------
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(event)
        local opts = { buffer = event.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end, opts) -- [L]ist [D]iagnostics under cursor
        vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, opts) -- [F]ormat
        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<c-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
        vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
        vim.keymap.set("n", "go", function() vim.lsp.buf.type_definition() end, opts)
        vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts) -- [V]im [W]orkspace [S]ymbol
      end
    })
  end,
}
