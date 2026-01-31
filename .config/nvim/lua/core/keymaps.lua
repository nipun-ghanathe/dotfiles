-- Mapping Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Navigating files using arglist
vim.keymap.set("n", "<leader>a", function()
  vim.cmd("$argadd")
  vim.notify("Buffer added to arglist")
end, { desc = "Add current buffer to arglist " })
vim.keymap.set("n", "<c-e>", require("config.arglist").edit_arglist, { desc = "Edit Arglist" })
vim.keymap.set("n", "<m-j>", "<cmd>argument 1<cr>", { desc = "Go to first buffer in arglist" })
vim.keymap.set("n", "<m-k>", "<cmd>argument 2<cr>", { desc = "Go to first buffer in arglist" })
vim.keymap.set("n", "<m-l>", "<cmd>argument 3<cr>", { desc = "Go to first buffer in arglist" })
vim.keymap.set("n", "<m-;>", "<cmd>argument 4<cr>", { desc = "Go to first buffer in arglist" })

-- Managing system clipboard
vim.keymap.set({ "n", "v" }, "gy", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set({ "n", "v" }, "gp", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set({ "n", "v" }, "gP", '"+P', { desc = "Paste before cursor from system clipboard" })

-- Running code
local runners = {
  python = "uv run",
  sh = "bash",
  javascript = "node",
  html = "xdg-open",
}
vim.keymap.set("n", "<localleader>rr", function()
  vim.cmd("write")
  local cmd = runners[vim.bo.filetype] or vim.bo.filetype
  vim.cmd("botright vert term " .. cmd .. " " .. vim.fn.expand("%"))
end, { desc = "Run code file in a vertical terminal" })
vim.keymap.set("n", "<localleader>rh", function()
  vim.cmd("write")
  local cmd = runners[vim.bo.filetype] or vim.bo.filetype
  vim.cmd("belowright term " .. cmd .. " " .. vim.fn.expand("%"))
end, { desc = "Run code file in a horizontal terminal" })
vim.keymap.set("n", "<localleader>rs", function()
  vim.cmd("write")
  local cmd = runners[vim.bo.filetype] or vim.bo.filetype
  vim.cmd("silent !" .. cmd .. " " .. vim.fn.expand("%"))
end, { desc = "Run code file silently without a terminal" })
