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
vim.keymap.set({'n', 'v'}, 'gd', '"_d')
vim.keymap.set({'n', 'v'}, 'x', '"_x')
vim.keymap.set({'n', 'v'}, 'X', '"_d')

-- Managing Buffers
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

-- Escaping Terminal Mode
vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>')

-- Opening terminal in Neovim
vim.keymap.set('n', '<leader>t', '<cmd>term<cr>')

-- Launching netrw
vim.keymap.set('n', '<leader>e', '<cmd>Ex<cr>')

-- Make the file executable
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<cr>')

-----------------------
----- LSP mappings -----
-----------------------
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local opts = { buffer = event.buf }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end, opts) -- [L]ist [D]iagnostics uner 
    vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, opts) -- [F]ormat
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<c-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "go", function() vim.lsp.buf.type_definition() end, opts)
    vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts) -- [V]im [W]orkspace [S]ymbol
  end
})

------------------------------------
----- Plugin specific mappings -----
------------------------------------

-- The following mappings have been added in the plugin.lua files

-- markdown-preview
-- vim.keymap.set('n', '<leader>mp', '<cmd>MarkdownPreviewToggle<cr>') -- [M]arkdown [P]review toggle

-- neo-tree
-- vim.keymap.set('n', '<leader>.', '<cmd>Neotree toggle<cr>')
-- vim.keymap.set('n', '<leader>gs', '<cmd>Neotree source=git_status reveal position=float toggle<cr>')
-- vim.keymap.set('n', '<leader>bl', '<cmd>Neotree source=buffers reveal position=float toggle<cr>')

-- harpoon
-- added these in harpoon.lua
-- local harpoon = require("harpoon")
-- 
-- vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
-- vim.keymap.set("n", "<c-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
-- 
-- Toggle previous and next buffers stored within Harpoon list
-- vim.keymap.set("n", "<c-h>", function() harpoon:list():prev() end)
-- vim.keymap.set("n", "<c-l>", function() harpoon:list():next() end)
-- 
-- vim.keymap.set("n", "<c-1>", function() harpoon:list():select(1) end)
-- vim.keymap.set("n", "<c-2>", function() harpoon:list():select(2) end)
-- vim.keymap.set("n", "<c-3>", function() harpoon:list():select(3) end)
-- vim.keymap.set("n", "<c-4>", function() harpoon:list():select(4) end)
-- vim.keymap.set("n", "<c-5>", function() harpoon:list():select(5) end)
-- vim.keymap.set("n", "<c-6>", function() harpoon:list():select(6) end)
-- vim.keymap.set("n", "<c-7>", function() harpoon:list():select(7) end)
-- vim.keymap.set("n", "<c-8>", function() harpoon:list():select(8) end)
-- vim.keymap.set("n", "<c-9>", function() harpoon:list():select(9) end)
-- vim.keymap.set("n", "<c-0>", function() harpoon:list():select(10) end)

-- telescope
-- added these in telescope.lua
-- local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>sf', builtin.find_files)
-- vim.keymap.set('n', '<leader>gf', builtin.git_files)
-- vim.keymap.set('n', '<leader>sg', builtin.live_grep)
-- vim.keymap.set('n', '<leader>sb', builtin.buffers)
-- vim.keymap.set('n', '<leader>sh', builtin.help_tags)
-- vim.keymap.set('n', '<leader>sk', builtin.keymaps)
-- vim.keymap.set('n', '<leader>sd', builtin.diagnostics)
