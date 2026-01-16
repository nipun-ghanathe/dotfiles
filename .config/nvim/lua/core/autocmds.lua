vim.api.nvim_create_augroup("user_autocmds", { clear = true })

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = "user_autocmds",
  desc = "Highlight on yank",
  callback = function()
    vim.hl.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

-- Exit using 'q' on some filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = "user_autocmds",
  desc = "Quit some windows simply using 'q'",
  pattern = { "help", "man", "git" },
  callback = function()
    vim.keymap.set("n", "q", "<cmd>q<cr>", { buffer = true })
  end,
})
