-- Change filetype to htmldjango if pyright found
local found_pyright = false
for _, client in ipairs(vim.lsp.get_clients()) do
  if client.name == "pyright" then
    found_pyright = true
    vim.opt_local.filetype = "htmldjango"
    break
  end
end

-- Change indentation to 2-spaced if pyright not found
if not found_pyright then
  vim.opt_local.tabstop = 2
  vim.opt_local.softtabstop = 2
  vim.opt_local.shiftwidth = 2
end

-- TODO:
-- Improve the below code
-- It was written in a quick way, to just get the work done

--------------------------------------------------
----- live-server
--------------------------------------------------

local live_server_running = false

local function launch_liveserver()
  vim.cmd("tabnew")
  vim.cmd("term live-server --no-browser")
  vim.cmd("stopinsert")
  vim.cmd("tabprev")
  live_server_running = true
end

local function open_file()
  local current_rel_path = vim.fn.expand("%")
  vim.fn.jobstart({ "xdg-open", "http://127.0.0.1:8080/" .. current_rel_path }, { detach = true })
end

-- Set usercmd for opening file
vim.api.nvim_create_user_command("OpenWithLiveServer", function()
  if live_server_running then
    open_file()
  else
    launch_liveserver()
    open_file()
  end
end, {})

-- Set usercmd for launching live server manually
vim.api.nvim_create_user_command("LiveServer", launch_liveserver, {})

-- Kill live-server before leaving
vim.api.nvim_create_autocmd("VimLeave", {
  pattern = "*",
  callback = function()
    local live_server_processes = vim.split(vim.fn.system("pgrep -f live-server"), "\n")
    for _, pid in ipairs(live_server_processes) do
      vim.fn.jobstart({ "kill", "-9", pid })
    end
  end,
})

-- Set keymap for opening file with live server
vim.keymap.set(
  "n",
  "<localleader>rl",
  "<cmd>OpenWithLiveServer<cr>",
  { buffer = true, desc = "Open HTML file in browser with Live Server" }
)
