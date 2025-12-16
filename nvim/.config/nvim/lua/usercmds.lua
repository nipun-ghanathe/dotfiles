-- confirmation before quitting if unsaved files exist
vim.cmd([[
  cabbrev quit confirm quit
  cabbrev q confirm quit
]])

-- prevent closing of tab with buffer deletion
vim.api.nvim_create_user_command("BDelete", function(opts)
  if opts.bang then
    vim.cmd("bdelete!")
    return
  end

  local cur = vim.api.nvim_get_current_buf()
  local bufs = vim.fn.getbufinfo({ buflisted = 1 })

  for _, buf in ipairs(bufs) do
    if buf.bufnr ~= cur and vim.bo[buf.bufnr].buftype ~= "terminal" then
      vim.api.nvim_set_current_buf(buf.bufnr)
      vim.cmd.bdelete(cur)
      return
    end
  end

  vim.cmd.enew()
  vim.cmd.bdelete(cur)
end, {
  bang = true,
  desc = "Delete buffer without closing the tab. Behave as normal :bd! for bang.",
})
vim.cmd("cabbrev bd BDelete")
