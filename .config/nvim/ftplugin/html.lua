-- usercmd to launch live-server
vim.api.nvim_create_user_command("LiveServer", function()
  vim.system({ "live-server" })
end, {})
