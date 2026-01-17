----------------
--- Fugitive ---
----------------

vim.pack.add({ "https://github.com/tpope/vim-fugitive" })

vim.keymap.set("n", "<leader>gs", "<cmd>Git<cr>", { desc = "Fugitive summary window" })

vim.api.nvim_create_autocmd("User", {
  group = "user_autocmds",
  desc = "configure fugitive summary window",
  pattern = { "FugitiveIndex" },
  callback = function(ev)
    if vim.api.nvim_buf_line_count(ev.buf) >= 5 then
      vim.api.nvim_win_set_cursor(0, { 5, 0 })
    end
    vim.opt_local.cursorlineopt = "both"
    vim.keymap.set("n", "q", "gq", { desc = "Close fugitive summary window", buffer = true, remap = true })
  end,
})

----------------
--- Gitsigns ---
----------------

vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })
