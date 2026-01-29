vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

vim.g.autoformat_enabled = true

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
  format_on_save = function()
    if not vim.g.autoformat_enabled then
      return
    else
      return {}
    end
  end,
})

vim.api.nvim_create_user_command("FormatOnSaveToggle", function()
  vim.g.autoformat_enabled = not vim.g.autoformat_enabled
end, {})

vim.keymap.set("n", "<leader>gw", require("conform").format, { desc = "Conform: Format File" })
