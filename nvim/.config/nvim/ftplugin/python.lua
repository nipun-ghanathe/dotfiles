-- Continue comment leader on Enter an o/O
vim.opt_local.formatoptions:append("ro")

--------------------------------------------------
----- Keymaps for py:percent format and vim-slime
--------------------------------------------------

-- Set the cell delimiter
vim.b.slime_cell_delimiter = [[^#\s\?%%]]

-- Open Tmux Split Panes with IPython
vim.keymap.set(
  "n",
  "<localleader>tr",
  "<cmd>silent !tmux split-window -h -d uv run ipython3<cr>",
  { desc = "Tmux Split REPL - IPython" }
)
vim.keymap.set(
  "n",
  "<localleader>thr",
  [[<cmd>silent !tmux split-window -v -l 40\% -d uv run ipython3<cr>]],
  { desc = "Tmux Horizonal Split REPL - IPython" }
)

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
