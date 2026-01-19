--------------
--- Neogit ---
--------------

vim.pack.add({ "https://github.com/nvim-lua/plenary.nvim" })
vim.pack.add({ "https://github.com/NeogitOrg/neogit" })

require("neogit").setup({
  disable_hint = true,
  disable_context_highlighting = true,
  remember_settings = false,
  use_per_project_settings = false,
  signs = {
    hunk = { "", "" },
    item = { "", "" },
    section = { "▸", "▾" },
  },
})

vim.keymap.set("n", "<leader>gs", require("neogit").open, { desc = "Neogit status window" })

vim.api.nvim_create_autocmd("FileType", {
  group = "user_autocmds",
  pattern = "Neogit*",
  callback = function()
    vim.opt_local.cursorlineopt = "both"
    vim.opt_local.colorcolumn = "0"
  end,
})

----------------
--- Gitsigns ---
----------------

vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })
