-- Move between cells
vim.keymap.set("n", "<C-j>", function()
  vim.fn.search(vim.b.slime_cell_delimiter, "W")
end, { buffer = 0, desc = "Jump to next Python cell" })
vim.keymap.set("n", "<C-k>", function()
  vim.fn.search(vim.b.slime_cell_delimiter, "bW")
end, { buffer = 0, desc = "Jump to previous Python cell" })

-- TODOs
-- TODO: Create new cell (above or below)
-- TODO: Delete current cell
