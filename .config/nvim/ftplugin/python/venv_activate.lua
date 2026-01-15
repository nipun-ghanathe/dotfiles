if not vim.g.load_venv_activate then
  return
end

PYTHON_LSP = "pyright"

-- get the Python LSP
local client = vim.lsp.get_clients({ name = PYTHON_LSP })[1]

-- get the root_dir
local root_dir = vim.fn.getcwd()
if client and client.root_dir then
  root_dir = client.root_dir
end

-- get the venv paths
local venv_dir = vim.fs.joinpath(root_dir, ".venv")
local venv_bin = vim.fs.joinpath(venv_dir, "bin")
local venv_python = vim.fs.joinpath(venv_bin, "python")

-- exit if the virtual env does not exist
if vim.fn.executable(venv_python) == 0 then
  return 1
end
-- else do the required things to set venv up

-- add venv's bin to PATH
vim.fn.setenv("PATH", venv_bin .. ":" .. vim.fn.getenv("PATH"))

-- set VIRTUAL_ENV environment variable
vim.fn.setenv("VIRTUAL_ENV", venv_dir)
-- todo: for conda env set CONDA_PREFIX

-- confirm that the LSP client exists
if not client then
  vim.notify(PYTHON_LSP .. " not found for Virtual Environment LSP Hooks.", vim.log.levels.DEBUG)
  return 1
end

-- Set the pythonPath for LSP
if client.settings then
  client.settings = vim.tbl_deep_extend("force", client.settings, {
    python = {
      pythonPath = venv_python,
    },
  })
else
  client.config.settings = vim.tbl_deep_extend("force", client.settings, {
    python = {
      pythonPath = venv_python,
    },
  })
end
client:notify("workspace/didChangeConfiguration", { settings = nil })

vim.notify(
  "Registered '" .. venv_python .. "' with " .. client.name .. " LSP.",
  vim.log.levels.INFO,
  { title = "Virtual Env Activated" }
)
