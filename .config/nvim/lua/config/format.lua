vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

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
})

local organize_imports_filetypes = {
  "python",
}

local function format_file(bufnr)
  bufnr = bufnr or 0

  local conform_opts = { bufnr = bufnr, lsp_format = "fallback", timeout_ms = 2000 }

  if vim.tbl_contains(organize_imports_filetypes, vim.bo[bufnr].filetype) then
    vim.lsp.buf.code_action({
      ---@diagnostic disable-next-line: missing-fields
      context = { only = { "source.organizeImports" } },
      apply = true,
    })
  end

  require("conform").format(conform_opts)
end

-- keymap to format
vim.keymap.set("n", "<leader>gw", format_file, { desc = "Conform: Format File" })

-------------------------
--- set up autoformat ---
-------------------------

vim.g.autoformat_enabled = true

vim.api.nvim_create_user_command("FormatOnSaveToggle", function()
  vim.g.autoformat_enabled = not vim.g.autoformat_enabled
  vim.notify("autoformat_enabled: " .. tostring(vim.g.autoformat_enabled), vim.log.levels.INFO)
end, {})

local augroup = vim.api.nvim_create_augroup("FormatConfig", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  desc = "Format before save",
  callback = function(ev)
    if vim.g.autoformat_enabled then
      format_file(ev.buf)
    end
  end,
})
