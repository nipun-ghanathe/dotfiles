-- exit if venv already activated
if vim.g.python_venv_activated then
  return
end

local client = vim.lsp.get_clients({ name = "pyright" })[1]
local root_dir = client and client.root_dir or vim.fn.getcwd()

-- activate venv if exists
if vim.uv.fs_stat(root_dir .. "/.venv/bin/python") then
  vim.g.python_venv_activated = true
  if not string.find(vim.env.PATH, root_dir .. "/.venv/bin") then
    vim.env.PATH = root_dir .. "/.venv/bin" .. ":" .. vim.env.PATH
  end
  vim.env.VIRTUAL_ENV = root_dir .. "/.venv"
end
