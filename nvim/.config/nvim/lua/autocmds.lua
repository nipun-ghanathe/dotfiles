local augroup = vim.api.nvim_create_augroup("user_autocmds", { clear = true })

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  desc = "Highlight on yank",
  callback = function(event)
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "help", "man", "git" },
  desc = "Quit some windows simply using 'q'",
  callback = function()
    vim.keymap.set("n", "q", "<cmd>q<cr>", { buffer = true })
  end,
})

-- When entering a terminal enter in insert mode
vim.api.nvim_create_autocmd("TermOpen", {
  group = augroup,
  desc = "Start Insert when opening Terminal",
  pattern = "*",
  callback = function()
    vim.cmd("startinsert")
  end,
})
