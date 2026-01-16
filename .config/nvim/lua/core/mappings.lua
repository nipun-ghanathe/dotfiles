-- Mapping Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Managing system clipboard
vim.keymap.set({ "n", "v" }, "gy", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set({ "n", "v" }, "gp", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set({ "n", "v" }, "gP", '"+P', { desc = "Paste before cursor from system clipboard" })

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
