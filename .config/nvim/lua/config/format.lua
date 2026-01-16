vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

vim.g.enable_autoformat = true

require("conform").setup({
  formatters_by_ft = {
    -- python = { "black" },
    html = { "prettier" },
    css = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    markdown = { "prettier" },
  },
  default_format_opts = {
    lsp_format = "fallback",
  },
  format_on_save = vim.g.enable_autoformat,
})

vim.api.nvim_create_user_command("FormatOnSaveToggle", function()
  vim.g.enable_autoformat = not vim.g.enable_autoformat
end, {})

vim.keymap.set("n", "<leader>gw", require("conform").format, { desc = "Conform: Format File" })
