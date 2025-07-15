for _, client in ipairs(vim.lsp.get_clients()) do
  if client.name == "pyright" then
    vim.bo.filetype = "htmldjango"
    break
  end
end
