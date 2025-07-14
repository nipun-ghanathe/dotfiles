for _, client in ipairs(vim.lsp.get_clients()) do
  if client.name == "pyright" then
    vim.bo.filetype = "htmldjango"
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
    vim.bo.shiftwidth = 4
    break
  end
end
