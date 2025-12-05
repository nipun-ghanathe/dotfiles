-- Options
vim.opt_local.cursorlineopt = "both"

-- Mappings
vim.keymap.set("n", "h", "-", { buffer = true, remap = true }) -- go up a directory
vim.keymap.set("n", "l", "<cr>", { buffer = true, remap = true }) -- open directory/file under cursor
