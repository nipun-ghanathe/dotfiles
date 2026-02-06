-- Mapping Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Navigating files using arglist
vim.keymap.set("n", "<leader>a", function()
  vim.cmd("$argadd")
  vim.notify("File added to arglist")
end, { desc = "Add current file to arglist " })
vim.keymap.set("n", "<leader>A", function() require("config.arglist").edit_arglist() end, { desc = "Edit Arglist" })
vim.keymap.set("n", "<m-j>", "<cmd>argument 1<cr>", { desc = "Go to first file in arglist" })
vim.keymap.set("n", "<m-k>", "<cmd>argument 2<cr>", { desc = "Go to second file in arglist" })
vim.keymap.set("n", "<m-l>", "<cmd>argument 3<cr>", { desc = "Go to third file in arglist" })
vim.keymap.set("n", "<m-;>", "<cmd>argument 4<cr>", { desc = "Go to fourth file in arglist" })

-- Managing system clipboard
vim.keymap.set({ "n", "v" }, "gy", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set({ "n", "v" }, "gp", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set({ "n", "v" }, "gP", '"+P', { desc = "Paste before cursor from system clipboard" })
