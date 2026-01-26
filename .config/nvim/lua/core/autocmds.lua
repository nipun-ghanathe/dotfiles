vim.api.nvim_create_augroup("user_autocmds", { clear = true })

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = "user_autocmds",
  desc = "Highlight on yank",
  callback = function()
    vim.hl.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})
