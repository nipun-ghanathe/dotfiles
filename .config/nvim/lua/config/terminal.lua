local term_buf
local function toggle_terminal()
  if not vim.api.nvim_buf_is_valid(term_buf or -1) then
    vim.cmd.terminal()
    term_buf = vim.api.nvim_get_current_buf()
    return
  end
  if term_buf == vim.api.nvim_get_current_buf() then
    local alt_buf = vim.fn.bufnr("#")
    if vim.api.nvim_buf_is_valid(alt_buf) and alt_buf ~= term_buf then
      vim.api.nvim_set_current_buf(alt_buf)
    else
      vim.cmd.stopinsert()
    end
    return
  end
  vim.api.nvim_set_current_buf(term_buf)
end
vim.keymap.set({ "n", "t" }, "<c-`>", toggle_terminal, { desc = "Toggle Terminal" })
