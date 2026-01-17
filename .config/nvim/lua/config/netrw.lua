-- Options
-- vim.g.netrw_liststyle = 3 -- tree list style
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 30
vim.g.netrw_localcopydircmd = "cp -r"
vim.api.nvim_set_hl(0, "netrwMarkFile", { link = "Search" })

-- Mappings
vim.keymap.set("n", "<leader>e", "<cmd>Ex<cr>", { desc = "Explore - Open netrw" })
vim.keymap.set("n", "<leader>.", "<cmd>e .<cr>", { desc = "Explore - Open netrw in cwd" })
