local term_buf
local toggle_terminal = function()
  if not (term_buf and vim.api.nvim_buf_is_valid(term_buf)) then
    vim.cmd.terminal()
    term_buf = vim.api.nvim_get_current_buf()
    return
  end
  if term_buf == vim.api.nvim_get_current_buf() then
    local alt_buf = vim.fn.bufnr("#")
    if vim.api.nvim_buf_is_valid(alt_buf) and alt_buf ~= term_buf then
      vim.api.nvim_set_current_buf(alt_buf)
    else
      vim.api.nvim_set_current_buf(vim.api.nvim_create_buf(false, true))
      vim.bo.bufhidden = "wipe"
    end
  else
    vim.api.nvim_set_current_buf(term_buf)
  end
end
vim.keymap.set({ "n", "t" }, "<c-`>", toggle_terminal, { desc = "Toggle Terminal" })
