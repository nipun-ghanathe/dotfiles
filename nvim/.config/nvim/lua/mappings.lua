-- Mapping Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Escaping insert mode
-- You can also use CapsLock key as Esc 
vim.keymap.set('i', 'jk', '<esc>')

-- Managing clipboard
vim.keymap.set({'n', 'v'}, 'gy', '"+y')
vim.keymap.set({'n', 'v'}, 'gp', '"+p')
vim.keymap.set({'n', 'v'}, 'gP', '"+P')
vim.keymap.set({'n', 'v'}, '<leader>p', '"0p')

-- Managing Buffers
vim.keymap.set('n', '<leader>ob', '<cmd>:%bd | e#<cr>') -- make this the [o]nly [b]uffer by closing all others and re-opening current one
vim.keymap.set('n', '<leader>bn', '<cmd>bnext<cr>')
vim.keymap.set('n', '<leader>bp', '<cmd>bprev<cr>')
vim.keymap.set('n', '<leader>bl', '<cmd>buffers<cr>')
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<cr>')

-- Improving scrolling experience
-- vim.keymap.set('n', '<c-e>', '<c-e>zz')
-- vim.keymap.set('n', '<c-y>', '<c-y>zz')
vim.keymap.set('n', '<c-d>', '<c-d>zz')
vim.keymap.set('n', '<c-u>', '<c-u>zz')
vim.keymap.set('n', '<c-f>', '<c-f>zz')
vim.keymap.set('n', '<c-b>', '<c-b>zz')

-- Improving search scrolling experience
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
vim.keymap.set('n', '*', '*zz')
vim.keymap.set('n', '#', '#zz')

-- Configuring neovim's terminal
vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>')
vim.keymap.set('n', '<leader>t', '<cmd>vertical terminal<cr>')
vim.keymap.set('n', '<leader>ht', '<cmd>horizontal terminal<cr>')

-- Cmdline mappings
vim.keymap.set('c', '<c-a>', '<home>')
vim.keymap.set('c', '<c-e>', '<end>')
vim.keymap.set('c', '<c-f>', '<right>')
vim.keymap.set('c', '<c-b>', '<left>')
vim.keymap.set('c', '<m-f>', '<c-right>')
vim.keymap.set('c', '<m-b>', '<c-left>')

-- Launching netrw
-- vim.keymap.set('n', '<leader>e', '<cmd>Ex<cr>')

-- Running code of interpreted languages
-- To run compiled languages keymaps have been overwritten in autocmds.lua
local runners = {
  python = "uv run",
  sh = "bash",
}

-- Run code in a vertical terminal
vim.keymap.set("n", "<leader>r", function()
  vim.cmd("write")
  local cmd = runners[vim.bo.filetype] or vim.bo.filetype
  vim.cmd("vertical terminal " .. cmd .. " " .. vim.fn.expand("%"))
end)
-- Run code in a horizontal terminal
vim.keymap.set("n", "<leader>hr", function()
  vim.cmd("write")
  local cmd = runners[vim.bo.filetype] or vim.bo.filetype
  vim.cmd("horizontal terminal " .. cmd .. " " .. vim.fn.expand("%"))
end)

-- If you're checking the list of kemappings
-- do also check the plugin files
-- or use `:Telescope keymaps`
