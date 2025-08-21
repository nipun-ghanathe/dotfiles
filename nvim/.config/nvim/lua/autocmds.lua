local augroup = vim.api.nvim_create_augroup("user_autocmds", { clear = true })

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  desc = "Highlight on yank",
  callback = function(event)
    vim.hl.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

-- Exit using 'q' on some filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  desc = "Quit some windows simply using 'q'",
  pattern = { "help", "man", "git" },
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

-- Switch to the prev tab instead of next tab when TabClosed
vim.api.nvim_create_autocmd("TabClosed", {
  group = augroup,
  desc = "Switch to first tab when tab is closed.",
  pattern = "*",
  command = "tabprev",
})
