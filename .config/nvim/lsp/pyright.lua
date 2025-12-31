return {
  cmd = { "pyright-langserver", "--stdio" },
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
  settings = {
    -- Disable Pyright import organize and analysis to use Ruff exclusively
    pyright = { disableOrganizeImports = true },
    python = {
      analysis = { ignore = { "*" } },
    },
  },
  -- Disabling diagnostics from Pyright
  handlers = {
    ["textDocument/publishDiagnostics"] = function(...) end,
  },
}
