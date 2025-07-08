return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "mason-org/mason.nvim",           version = "^1.0.0" },
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
        -- Using Ruff's import organize
        pyright = { disableOrganizeImports = true },
        -- Ignore all files for analysis to exclusively use Ruff for linting
        python = { analysis = { ignore = { "*" } },
        },
      },
    })
    lspconfig.ruff.setup({})
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

    vim.diagnostic.config({ float = { border = "rounded" } })
    vim.diagnostic.config({
      float = { border = "rounded" },
      virtual_text = false,
    })

    ------------------------
    ----- LSP mappings -----
    ------------------------
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(event)
        local buf = event.buf

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = buf, desc = "LSP: Go to definition" })
        vim.keymap.set("n", "go", vim.lsp.buf.type_definition, { buffer = buf, desc = "LSP: Go to type definition" })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = buf, desc = "LSP: Go to declaration" })
        vim.keymap.set("n", "gri", vim.lsp.buf.implementation, { buffer = buf, desc = "LSP: Go to implementation" })
        vim.keymap.set("n", "grr", vim.lsp.buf.references, { buffer = buf, desc = "LSP: List references" })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = buf, desc = "LSP: Hover Documentation" })
        vim.keymap.set("i", "<c-k>", vim.lsp.buf.signature_help,
          { buffer = buf, desc = "LSP: Signature Help (insert mode)" })
        vim.keymap.set("n", "gK", vim.lsp.buf.signature_help, { buffer = buf, desc = "LSP: Signature Help" })
        vim.keymap.set("n", "grn", vim.lsp.buf.rename, { buffer = buf, desc = "LSP: Rename Symbol" })
        vim.keymap.set("n", "gra", vim.lsp.buf.code_action, { buffer = buf, desc = "LSP: Code Actions" })
        vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { buffer = buf, desc = "LSP: Format Buffer" })

        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = buf, desc = "Diagnostics: Next" })
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = buf, desc = "Diagnostics: Previous" })
        vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float,
          { buffer = buf, desc = "Diagonstics: Show line diagnostics" })
        vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { buffer = buf, desc = "Diagonstics: Open loclist" })
      end
    })
  end,
}
