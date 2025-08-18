if not vim.g.load_ipython_slime then
  return
end

-- Set the cell delimiter
vim.b.slime_cell_delimiter = [[^#\s\?%%]]
-- Set the REPL command
vim.b.slime_repl_command = "uv run ipython3"
