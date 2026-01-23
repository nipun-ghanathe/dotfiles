vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })

------------------------------
--- Setting up LSP Servers ---
------------------------------

-- Create augroup to use with lsp related autocmds
vim.api.nvim_create_augroup("lsp_user_autocmds", { clear = true })

-- Configure LSPs
vim.lsp.config("ruff", {
  on_attach = function()
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = "lsp_user_autocmds",
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
  "pyright",
  "ruff",
  "emmet_language_server",
  "html",
  "cssls",
  "ts_ls",
})

-----------------------------
--- Configure diagnostics ---
-----------------------------

vim.diagnostic.config({
  underline = false,
  virtual_text = false,
  virtual_lines = false,
  severity_sort = false,
  signs = true,
  float = { source = true },
  jump = { float = true },
})

-- --------------------
-- --- LSP mappings ---
-- --------------------
--
-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = "lsp_user_autocmds",
--   desc = "Set LSP related keymaps",
--   callback = function(ev)
--   end,
-- })
