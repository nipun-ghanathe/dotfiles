---------------------
--- Configuration ---
---------------------

vim.g.slime_no_mappings = true

vim.g.slime_bracketed_paste = true

vim.g.slime_target = "tmux"
vim.g.slime_default_config = { socket_name = "default", target_pane = ":.1" }
vim.g.slime_dont_ask_default = true

-- vim.g.slime_target = "nvim"
-- vim.g.slime_input_pid = false
-- vim.g.slime_suggest_default = true
-- vim.g.slime_menu_config = false
-- vim.g.slime_neovim_ignore_unlisted = false

---------------
--- Packadd ---
---------------

vim.pack.add({ "https://github.com/jpalardy/vim-slime" })

--------------------------
--- More Configuration ---
--------------------------

vim.g.slime_cell_delimiter = ""
local ft_cell_delimiters = {
  python = [[^#\s*%%]],
  r = [[^#\s*%%]],
  julia = [[^#\s*%%]],
  matlab = [[^%%]],
  octave = [[^%%]],
}
local augroup = vim.api.nvim_create_augroup("slime_user_autocmds", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  desc = "Set slime cell delimiter",
  pattern = "*",
  callback = function(ev)
    local ft = vim.bo[ev.buf].filetype
    if ft_cell_delimiters[ft] then
      vim.b.slime_cell_delimiter = ft_cell_delimiters[ft]
    end
  end,
})

-----------------
--- Functions ---
-----------------

local function slime_send_raw(to_send)
  local orig = vim.g.slime_bracketed_paste
  vim.g.slime_bracketed_paste = false
  vim.fn["slime#send"](to_send)
  vim.g.slime_bracketed_paste = orig
end

local function send_ctrl(char)
  slime_send_raw(vim.api.nvim_replace_termcodes("<C-" .. char .. ">", true, false, true))
end

local function send_cr()
  slime_send_raw(vim.api.nvim_replace_termcodes("<CR>", true, false, true))
end

local function send_file()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local text = table.concat(lines, "\n")
  vim.fn["slime#send"](text)
  send_cr()
end

local function jump_cell(direction)
  local pattern = vim.fn["slime#config#resolve"]("cell_delimiter")
  if not pattern or pattern == "" then return end
  local search_flags = direction == "prev" and "bW"
      or direction == "next" and "W"
      or ""
  vim.fn.search(pattern, search_flags)
end

---------------
--- Keymaps ---
---------------

-- navigate cells
vim.keymap.set("n", "<c-j>", function() jump_cell("next") end, { desc = "Go to next cell" })
vim.keymap.set("n", "<c-k>", function() jump_cell("prev") end, { desc = "Go to prev cell" })

-- send lines to repl
vim.keymap.set("n", "<c-c><c-c>", function()
  return vim.fn["slime#config#resolve"]("cell_delimiter") ~= ""
      and "<Plug>SlimeSendCell"
      or "<Plug>SlimeParagraphSend"
end, { expr = true, desc = "Slime: Send Cell/Block" })
vim.keymap.set("n", "<c-c><c-p>", "<Plug>SlimeParagraphSend", { desc = "Slime: Send Paragraph" })
vim.keymap.set("n", "<c-c><c-space>", "<Plug>SlimeLineSend", { desc = "Slime: Send Line" })
vim.keymap.set("v", "<c-c><c-c>", "<Plug>SlimeRegionSend", { desc = "Slime: Send Region" })
vim.keymap.set("n", "<c-c><c-f>", send_file, { desc = "Slime: Send File" })

-- send keycodes
vim.keymap.set("n", "<c-c><c-l>", function() send_ctrl("l") end, { desc = "Slime: Send Clear (C-l)" })
vim.keymap.set("n", "<c-c><c-k><c-d>", function() send_ctrl("d") end, { desc = "Slime: Send Exit (C-d)" })
vim.keymap.set("n", "<c-c><c-k><c-c>", function() send_ctrl("c") end, { desc = "Slime: Send Interrupt (C-c)" })
vim.keymap.set("n", "<c-c><c-m>", send_cr, { desc = "Slime: Send Return (<CR>)" })
