----------------------------------
----- Setting up LSP Servers -----
----------------------------------
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp_config_files = vim.fn.readdir(vim.fn.stdpath("config") .. "/lsp")
for _, file in ipairs(lsp_config_files) do
  local lsp_server = file:match("^(.*)%.lua")
  -- if lsp_server ~= "ruff" then
  --   vim.lsp.config(lsp_server, { capabilities = capabilities })
  -- end
  vim.lsp.enable(lsp_server)
end

---------------------------------
----- Configure diagnostics -----
---------------------------------
vim.diagnostic.config({
  underline = true,
  virtual_text = false,
  virtual_lines = false,
  severity_sort = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "󰌵",
    },
  },
  float = {
    source = true,
  },
})

-- ------------------------
-- ----- LSP mappings -----
-- ------------------------
-- vim.api.nvim_create_autocmd("LspAttach", {
--   callback = function(event)
--     vim.keymap.set(...)
--   end,
-- })
