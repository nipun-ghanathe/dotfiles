-- LSP Keymaps
vim.keymap.set('n', 'K', vim.lsp.buf.hover) -- hover information
vim.keymap.set('n', 'gd', vim.lsp.buf.definition) -- [g]o to [d]efinition
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration) -- [g]o to [D]eclaration
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation) -- [g]o to [i]mplementation
vim.keymap.set('n', 'go', vim.lsp.buf.type_definition) -- [g][o] to type definition
vim.keymap.set('n', 'gr', vim.lsp.buf.references) -- [g]o to [r]eferences
vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help) -- [g]et [s]ignature help
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename) -- [r]e[n]ame
vim.keymap.set({ 'n', 'x' }, '<leader>lf', function() vim.lsp.buf.format({ async = true }) end) -- [l]sp [f]ormat (format file using lsp)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action) -- open [c]ode [a]ctions menu
-- vim.keymap.set('n', '<leader>sd', function() require('telescope.builtin').diagnostics({ bufnr = 0, previewer = false, initial_mode = "normal" }) end) -- [s]earch [d]iagnostics -- (this shortcut is set in telescope.lua)
