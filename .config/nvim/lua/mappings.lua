-- Mapping Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- File Explorer (netrw)
vim.keymap.set("n", "<leader>e", "<cmd>Ex<cr>", { desc = "Explore - Open netrw" })
vim.keymap.set("n", "<leader>.", function()
  vim.cmd("Ex " .. vim.fn.getcwd())
end, { desc = "Explore - Open netrw in cwd" })

-- Managing system clipboard
vim.keymap.set({ "n", "v" }, "gy", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set({ "n", "v" }, "gp", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set({ "n", "v" }, "gP", '"+P', { desc = "Paste before cursor from system clipboard" })

-- Terminal configuration
vim.keymap.set("n", "<leader>tt", "<cmd>$tab term<cr>", { desc = "Terminal" })
vim.keymap.set("n", "<leader>th", function()
  vim.cmd("botright term")
  vim.cmd("resize " .. math.floor(vim.o.lines * 0.4))
end, { desc = "Horizontal Terminal" })
vim.keymap.set("n", "<leader>tv", function()
  vim.cmd("botright vert term")
  vim.cmd("vertical resize " .. math.floor(vim.o.columns * 0.4))
end, { desc = "Vertical Terminal" })

-- Tab navigation
vim.keymap.set({ "n", "t" }, "<c-tab>", "<cmd>tabnext<cr>", { desc = "Go to next tab" })
vim.keymap.set({ "n", "t" }, "<c-s-tab>", "<cmd>tabprev<cr>", { desc = "Go to previous tab" })
for i = 1, 8 do
  vim.keymap.set({ "n", "t" }, "<m-" .. i .. ">", "<cmd>" .. i .. "tabnext<cr>", { desc = "Go to tab " .. i })
end
vim.keymap.set({ "n", "t" }, "<m-9>", "<cmd>tablast<cr>", { desc = "Go to last tab" })

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
vim.keymap.set("n", "<localleader>rr", function()
  vim.cmd("write")
  local cmd = runners[vim.bo.filetype] or vim.bo.filetype
  vim.cmd("botright vert term " .. cmd .. " " .. vim.fn.expand("%"))
end, { desc = "Run code file in a vertical terminal" })
-- Run code in a horizontal terminal
vim.keymap.set("n", "<localleader>rh", function()
  vim.cmd("write")
  local cmd = runners[vim.bo.filetype] or vim.bo.filetype
  vim.cmd("belowright term " .. cmd .. " " .. vim.fn.expand("%"))
end, { desc = "Run code file in a horizontal terminal" })
-- Run code silently without any terminal
vim.keymap.set("n", "<localleader>rs", function()
  vim.cmd("write")
  local cmd = runners[vim.bo.filetype] or vim.bo.filetype
  vim.cmd("silent !" .. cmd .. " " .. vim.fn.expand("%"))
end, { desc = "Run code file silently without a terminal" })
