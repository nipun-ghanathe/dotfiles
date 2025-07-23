local augroup = vim.api.nvim_create_augroup("user_cmds", { clear = true })

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  desc = "Highlight on yank",
  callback = function(event)
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
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
