-- Mapping Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Managing clipboard
vim.keymap.set({ "n", "v" }, "gy", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set({ "n", "v" }, "gp", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set({ "n", "v" }, "gP", '"+P', { desc = "Paste before cursor from system clipboard" })

-- Quick-fix list
vim.keymap.set("n", "]q", "<cmd>cnext<cr>", { desc = "Quick-fix: Next" })
vim.keymap.set("n", "[q", "<cmd>cprev<cr>", { desc = "Quick-fix: Previous" })

-- Improving scrolling experience
-- vim.keymap.set("n", "<c-e>", "<c-e>zz")
-- vim.keymap.set("n", "<c-y>", "<c-y>zz")
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")
vim.keymap.set("n", "<c-f>", "<c-f>zz")
vim.keymap.set("n", "<c-b>", "<c-b>zz")

-- Improving search scrolling experience
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "#", "#zz")

-- Configuring neovim's terminal
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

-- Cmdline mappings
vim.keymap.set("c", "<c-a>", "<home>")
vim.keymap.set("c", "<c-e>", "<end>")
vim.keymap.set("c", "<c-f>", "<right>")
vim.keymap.set("c", "<c-b>", "<left>")
vim.keymap.set("c", "<m-f>", "<c-right>")
vim.keymap.set("c", "<m-b>", "<c-left>")

-- Running code
local runners = {
  python = "uv run",
  sh = "bash",
  javascript = "node",
  html = "xdg-open",
}
-- Run code in a vertical terminal
vim.keymap.set("n", "<localleader>r", function()
  vim.cmd("write")
  local cmd = runners[vim.bo.filetype] or vim.bo.filetype
  vim.cmd("vert term " .. cmd .. " " .. vim.fn.expand("%"))
end, { desc = "Run code file in a vertical terminal" })
-- Run code in a horizontal terminal
vim.keymap.set("n", "<localleader>rh", function()
  vim.cmd("write")
  local cmd = runners[vim.bo.filetype] or vim.bo.filetype
  vim.cmd("belowright term " .. cmd .. " " .. vim.fn.expand("%"))
end, { desc = "Run code file in a horizontal terminal" })
