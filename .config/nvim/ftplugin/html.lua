if #vim.lsp.get_clients({ name = "pyright" }) ~= 0 then
  vim.bo.filetype = "htmldjango"
end
