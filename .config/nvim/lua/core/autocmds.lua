vim.api.nvim_create_augroup("user_autocmds", { clear = true })

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = "user_autocmds",
  desc = "Highlight on yank",
  callback = function()
    vim.hl.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

-- Change indentation to two spaces
vim.api.nvim_create_autocmd("FileType", {
  group = "user_autocmds",
  desc = "change indentation to two spaces",
  pattern = {
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "html",
    "css",
    "markdown",
    "json",
    "yaml",
    "lua",
  },
  callback = function()
    vim.bo.expandtab = true
    vim.bo.shiftwidth = 2
  end,
})
