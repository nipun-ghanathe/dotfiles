-- Concealing
vim.opt_local.conceallevel = 2
vim.opt_local.foldlevel = 0

-- Keybinds
vim.keymap.set("n", "gO", "<cmd>Neorg toc<cr>", { buffer = true })
