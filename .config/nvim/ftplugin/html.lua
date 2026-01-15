-- Change filetype to htmldjango if pyright found
local found_pyright = false
for _, client in ipairs(vim.lsp.get_clients()) do
  if client.name == "pyright" then
    found_pyright = true
    vim.opt_local.filetype = "htmldjango"
    break
  end
end

-- Change indentation to 2-spaced if pyright not found
if not found_pyright then
  vim.opt_local.tabstop = 2
  vim.opt_local.softtabstop = 2
  vim.opt_local.shiftwidth = 2
end
-- usercmd to launch live-server
vim.api.nvim_create_user_command("LiveServer", function()
  vim.fn.jobstart({ "live-server" }, { detach = true })
end, {})
