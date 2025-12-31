-- Clearing the 'DiagnosticUnnecessary' higroup
local ns = vim.api.nvim_create_namespace("lua_diag_unnecessary_disable")
vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", {})
vim.api.nvim_set_hl_ns(ns)
