-- Change filetype to htmldjango if pyright found
for _, client in ipairs(vim.lsp.get_clients()) do
  if client.name == "pyright" then
    vim.bo.filetype = "htmldjango"
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
    vim.bo.shiftwidth = 4
    break
  end
end

-- usercmd to launch live-server
vim.api.nvim_create_user_command("LiveServer", function()
  vim.fn.jobstart({ "live-server" }, { detach = true })
end, {})
