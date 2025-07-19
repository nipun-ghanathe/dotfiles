-- Defining variable capabilities for later use
local capabilities = require("cmp_nvim_lsp").default_capabilities()

----------------------------------
----- Setting up LSP Servers -----
----------------------------------
vim.lsp.enable("ruff")
vim.lsp.config("pyright", { capabilities = capabilities })
vim.lsp.enable("pyright")
vim.lsp.config("lua_ls", { capabilities = capabilities })
vim.lsp.enable("lua_ls")
vim.lsp.config("html_lsp", { capabilities = capabilities })
vim.lsp.enable("html_lsp")
vim.lsp.config("css_ls", { capabilities = capabilities })
vim.lsp.enable("css_ls")
vim.lsp.config("css_ls", { capabilities = capabilities })
vim.lsp.enable("css_ls")

---------------------------------
----- Configure diagnostics -----
---------------------------------
vim.diagnostic.config({
  float = { border = "rounded" },
  virtual_text = false,
})

------------------------
----- LSP mappings -----
------------------------
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = true, desc = "LSP: Go to definition" })
    vim.keymap.set("n", "grt", vim.lsp.buf.type_definition, { buffer = true, desc = "LSP: Go to type definition" })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = true, desc = "LSP: Go to declaration" })
    vim.keymap.set("n", "gri", vim.lsp.buf.implementation, { buffer = true, desc = "LSP: Go to implementation" })
    vim.keymap.set("n", "grr", vim.lsp.buf.references, { buffer = true, desc = "LSP: List references" })
    vim.keymap.set("n", "K", function()
      vim.lsp.buf.hover({ border = "rounded" })
    end, { buffer = true, desc = "LSP: Hover Documentation" })
    vim.keymap.set("i", "<c-k>", function()
      vim.lsp.buf.signature_help({ border = "rounded" })
    end, { buffer = true, desc = "LSP: Signature Help (insert mode)" })
    vim.keymap.set("n", "gK", function()
      vim.lsp.buf.signature_help({ border = "rounded" })
    end, { buffer = true, desc = "LSP: Signature Help" })
    vim.keymap.set("n", "grn", vim.lsp.buf.rename, { buffer = true, desc = "LSP: Rename Symbol" })
    vim.keymap.set("n", "gra", vim.lsp.buf.code_action, { buffer = true, desc = "LSP: Code Actions" })
    vim.keymap.set("n", "<leader>fl", vim.lsp.buf.format, { buffer = true, desc = "LSP: Format Buffer" })

    vim.keymap.set("n", "]d", function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, { buffer = true, desc = "Diagnostics: Next" })
    vim.keymap.set("n", "[d", function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, { buffer = true, desc = "Diagnostics: Previous" })
    vim.keymap.set(
      "n",
      "<c-w>d",
      vim.diagnostic.open_float,
      { buffer = true, desc = "Diagonstics: Show line diagnostics" }
    )
  end,
})
