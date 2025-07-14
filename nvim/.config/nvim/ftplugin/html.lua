for _, client in ipairs(vim.lsp.get_clients()) do
  if client.name == "pyright" then
    vim.opt_local.filetype = "htmldjango"
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth = 4
    break
  end
end
