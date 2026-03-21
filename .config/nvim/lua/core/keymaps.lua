-- Mapping Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Managing system clipboard
vim.keymap.set({ 'n', 'v' }, 'gy', '"+y', { desc = 'Yank to system clipboard' })
vim.keymap.set({ 'n', 'v' }, 'gp', '"+p', { desc = 'Paste from system clipboard' })
vim.keymap.set({ 'n', 'v' }, 'gP', '"+P', { desc = 'Paste before cursor from system clipboard' })
