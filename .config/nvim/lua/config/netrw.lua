-- Options
vim.g.netrw_banner = 0
vim.g.netrw_localcopydircmd = "cp -r"

-- Mappings
vim.keymap.set("n", "<leader>e", "<cmd>Ex<cr>", { desc = "Explore - Open netrw" })
vim.keymap.set("n", "<leader>.", "<cmd>e .<cr>", { desc = "Explore - Open netrw in cwd" })

-- options and mappings inside netrw
vim.api.nvim_create_autocmd("FileType", {
  group = "user_autocmds",
  desc = "options and mappings for netrw ft",
  pattern = "netrw",
  callback = function()
    -- Options
    vim.wo[0][0].cursorlineopt = "both"
    -- Mappings
    vim.keymap.set("n", "h", "-", { buffer = true, remap = true }) -- go up a directory
    vim.keymap.set("n", "l", "<cr>", { buffer = true, remap = true }) -- open directory/file under cursor
  end,
})
