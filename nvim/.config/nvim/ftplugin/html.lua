local found_pyright = false

for _, client in ipairs(vim.lsp.get_clients()) do
  if client.name == "pyright" then
    found_pyright = true
    vim.opt_local.filetype = "htmldjango"
    break
  end
end

if not found_pyright then
  vim.opt_local.tabstop = 2
  vim.opt_local.softtabstop = 2
  vim.opt_local.shiftwidth = 2
end
