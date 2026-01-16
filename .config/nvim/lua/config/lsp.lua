vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })

------------------------------
--- Setting up LSP Servers ---
------------------------------

-- Configure LSPs
vim.lsp.config("ruff", {
  on_attach = function()
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.py",
      desc = "Code action on save: Organize imports",
      callback = function()
        vim.lsp.buf.code_action({
          ---@diagnostic disable-next-line: missing-fields
          context = { only = { "source.organizeImports" } },
          apply = true,
        })
      end,
    })
  end,
})
-- TODO: If Neovim gets snippet support remove these lines
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
vim.lsp.config("html", { capabilities = capabilities })
vim.lsp.config("cssls", { capabilities = capabilities })

-- Enable LSPs
vim.lsp.enable({
  "lua_ls",
  "ts_ls",
  "pyright",
  "ruff",
  "html",
  "cssls",
})

-----------------------------
--- Configure diagnostics ---
-----------------------------

vim.diagnostic.config({
  underline = true,
  virtual_text = false,
  virtual_lines = false,
  severity_sort = false,
  signs = true,
  float = { source = true },
  jump = { float = true },
})

-- ----------------
-- --- LSP mappings
-- ----------------
--
-- vim.api.nvim_create_autocmd("LspAttach", {
--   callback = function(event)
--     vim.keymap.set(...)
--   end,
-- })
