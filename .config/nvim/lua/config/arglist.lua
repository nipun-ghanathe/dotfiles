local M = {}

M.edit_arglist = function()
  local args = vim.fn.argv()

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_name(buf, "[arglist]")
  vim.bo[buf].buftype = "acwrite"
  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].filetype = "arglist"

  local height = 10
  local width = math.floor(vim.o.columns * 0.60)
  local center_row = (vim.o.lines - height) / 2
  local row = math.max(math.floor(center_row - (vim.o.lines * 0.1)), 0)
  local col = math.floor((vim.o.columns - width) / 2)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    height = height,
    width = width,
    row = row,
    col = col,
    style = "minimal",
    title = " arglist ",
    title_pos = "center",
  })
  vim.wo[win].number = vim.go.number
  vim.wo[win].cursorline = vim.go.cursorline
  vim.wo[win].cursorlineopt = vim.go.cursorlineopt

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, args)
  vim.bo[buf].modified = false

  vim.keymap.set("n", "q", function()
    vim.api.nvim_win_close(win, false)
  end, { buffer = buf })

  vim.api.nvim_create_autocmd("BufWriteCmd", {
    buffer = buf,
    callback = function()
      if not vim.bo[buf].modified then return end
      vim.bo[buf].modified = false

      local lines = vim.tbl_filter(
        function(value) return value ~= "" end,
        vim.api.nvim_buf_get_lines(buf, 0, -1, false)
      )

      vim.cmd("%argdelete")
      if #lines ~= 0 then
        vim.cmd.argadd(lines)
      end
    end,
  })
end

return M
