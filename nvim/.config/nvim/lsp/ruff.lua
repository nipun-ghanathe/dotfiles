return {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
  root_markers = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    "pyrightconfig.json",
    "ruff.toml",
    ".ruff.toml",
    ".git",
    ".venv",
  },
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.py",
      desc = "Code Action on Save: Auto Organize Imports",
      callback = function()
        vim.lsp.buf.code_action({
          ---@diagnostic disable-next-line: missing-fields
          context = {
            only = { "source.organizeImports" },
          },
          apply = true,
        })
      end,
    })
  end,
}
