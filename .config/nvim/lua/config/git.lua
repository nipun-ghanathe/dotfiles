----------------
--- Fugitive ---
----------------

vim.pack.add({ "https://github.com/tpope/vim-fugitive" })

vim.keymap.set("n", "<leader>gs", "<cmd>Git<cr>", { desc = "Fugitive summary window" })

vim.api.nvim_create_autocmd("User", {
  group = "user_autocmds",
  desc = "configure fugitive summary window",
  pattern = { "FugitiveIndex" },
  callback = function()
    vim.api.nvim_win_set_cursor(0, { vim.fn.search("^$", "nW") + 1, 0 })
    vim.opt_local.cursorlineopt = "both"
    vim.keymap.set("n", "q", "gq", { desc = "Close fugitive summary window", buffer = true, remap = true })
  end,
})

----------------
--- Gitsigns ---
----------------

vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })
