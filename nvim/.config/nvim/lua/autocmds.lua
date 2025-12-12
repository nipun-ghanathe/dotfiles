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

-- Code to run for TermOpen
vim.api.nvim_create_autocmd("TermOpen", {
  group = augroup,
  desc = "Code to run for TermOpen",
  callback = function()
    vim.cmd("startinsert")
    vim.opt_local.scrolloff = 0
  end,
})

-- Code to run for entering terminal buffer
vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup,
  desc = "Code to run for terminal buffer",
  callback = function()
    if vim.bo.buftype == "terminal" then
      vim.cmd("startinsert")
    end
  end,
})
