-- Clearing the 'DiagnosticUnnecessary' higroup
local ns = vim.api.nvim_create_namespace("ft_lua_custom_hl_ns")
vim.api.nvim_set_hl(ns, "DiagnosticUnnecessary", {})
vim.api.nvim_win_set_hl_ns(0, ns)
