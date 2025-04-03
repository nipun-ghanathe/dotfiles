-- Mapping Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local remap = { remap = true }

-- Escaping insert mode
-- vim.keymap.set('i', 'jk', '<esc>')
-- Instead remap the CapsLock key to Esc 

-- Managing clipboard
vim.keymap.set({'n', 'v'}, 'gy', '"+y')
vim.keymap.set({'n', 'v'}, 'gp', '"+p')
vim.keymap.set({'n', 'v'}, 'x', '"_x')
vim.keymap.set({'n', 'v'}, 'X', '"_d')
vim.keymap.set({'n', 'v'}, 'c', '"_c')

-- Managing Buffers
vim.keymap.set('n', '<leader>bn', '<cmd>bnext<cr>')
vim.keymap.set('n', '<leader>bp', '<cmd>bprev<cr>')
vim.keymap.set('n', '<leader>bl', '<cmd>buffers<cr>')
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<cr>')
vim.keymap.set('n', '<leader>b1', '<cmd>b 1<cr>')
vim.keymap.set('n', '<leader>b2', '<cmd>b 2<cr>')
vim.keymap.set('n', '<leader>b3', '<cmd>b 3<cr>')
vim.keymap.set('n', '<leader>b4', '<cmd>b 4<cr>')
vim.keymap.set('n', '<leader>b5', '<cmd>b 5<cr>')
vim.keymap.set('n', '<leader>b6', '<cmd>b 6<cr>')
vim.keymap.set('n', '<leader>b7', '<cmd>b 7<cr>')
vim.keymap.set('n', '<leader>b8', '<cmd>b 8<cr>')
vim.keymap.set('n', '<leader>b9', '<cmd>b 9<cr>')
vim.keymap.set('n', '<leader>b0', '<cmd>b 0<cr>')

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

-- Escaping Terminal Mode
vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>')

-- Opening terminal in Neovim
vim.keymap.set('n', '<leader>t', '<cmd>term<cr>')
