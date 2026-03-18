vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

-- Set up formatters for filetypes
require("conform").setup({
  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
  }
})

local organize_imports_filetypes = { "python" }

local function format_file(bufnr)
  bufnr = bufnr or 0
  local conform_opts = { bufnr = bufnr, lsp_format = "fallback", timeout_ms = 2000 }
  require("conform").format(conform_opts)

  if vim.list_contains(organize_imports_filetypes, vim.bo[bufnr].filetype) then
    vim.lsp.buf.code_action({
      ---@diagnostic disable-next-line: missing-fields
      context = { only = { "source.organizeImports" } },
      apply = true,
    })
  end
end

-- keymap to format
vim.keymap.set("n", "<leader>gw", format_file, { desc = "Conform: Format File" })

-------------------------
--- set up autoformat ---
-------------------------

vim.g.formatonsave = false

vim.api.nvim_create_user_command("FormatOnSaveToggle", function(opts)
  local var = opts.bang and vim.b or vim.g
  var.formatonsave = var.formatonsave ~= true
  vim.notify(
    string.format(
      "format on save -> global: %s | buffer: %s",
      vim.g.formatonsave,
      vim.b.formatonsave == nil and "inherit" or vim.b.formatonsave
    ),
    vim.log.levels.INFO
  )
end, { bang = true })

local augroup = vim.api.nvim_create_augroup("FormatConfig", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  desc = "Format before save",
  callback = function(ev)
    if vim.b.formatonsave == true or (vim.b.formatonsave == nil and vim.g.formatonsave) then
      format_file(ev.buf)
    end
  end,
})
