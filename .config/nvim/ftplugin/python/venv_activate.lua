if not vim.g.load_venv_activate then
  return
end

PYTHON_LSP = "pyright"

-- get the Python LSP
local client = vim.lsp.get_clients({ name = PYTHON_LSP })[1]

-- get the root_dir
local root_dir = client and client.root_dir or vim.fn.getcwd()

-- get the venv paths
local venv_dir = vim.fs.joinpath(root_dir, ".venv")
local venv_bin = vim.fs.joinpath(venv_dir, "bin")
local venv_python = vim.fs.joinpath(venv_bin, "python")

-- exit if the virtual env does not exist
if vim.fn.executable(venv_python) == 0 then
  return
end
-- else do the required things to set venv up

-- add venv's bin to PATH
vim.fn.setenv("PATH", venv_bin .. ":" .. vim.fn.getenv("PATH"))

-- set VIRTUAL_ENV environment variable
vim.fn.setenv("VIRTUAL_ENV", venv_dir)
-- todo: for conda env set CONDA_PREFIX
