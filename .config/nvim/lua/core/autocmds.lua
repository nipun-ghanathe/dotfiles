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
    "sql",
    "html",
    "htmldjango",
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

-- Remove trailing spaces
vim.api.nvim_create_autocmd("BufWritePre", {
  group = "user_autocmds",
  desc = "remove trailing spaces",
  callback = function()
    local view = vim.fn.winsaveview()
    vim.cmd([[silent! keepjumps keeppatterns %s/\s\+$//e]])
    vim.fn.winrestview(view)
  end
})
