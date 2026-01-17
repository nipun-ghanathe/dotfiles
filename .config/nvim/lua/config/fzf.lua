vim.pack.add({ "https://github.com/ibhagwan/fzf-lua" })

local fzf = require("fzf-lua")

-- Configure fzf-lua
fzf.setup({
  keymap = {
    fzf = {
      true,
      -- Use <c-q> to select all items and add them to quickfix list
      ["ctrl-q"] = "select-all+accept",
    },
  },
})

-- Register fzf-lua as the UI interface for vim.ui.select
fzf.register_ui_select()

-- Set general keymaps
vim.keymap.set("n", "<leader>pf", fzf.git_files, { desc = "Fzf: Project Files" })
vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Fzf: Files" })
vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Fzf: Live Grep" })
vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Fzf: Buffers" })
vim.keymap.set("n", "<leader>fcs", fzf.colorschemes, { desc = "Fzf: Colorschemes" })
vim.keymap.set("n", "<leader>fch", fzf.command_history, { desc = "Fzf: Command History" })
vim.keymap.set("n", "<leader>ft", fzf.tagstack, { desc = "Fzf: Tagstack" })
vim.keymap.set("n", "<leader>fk", fzf.keymaps, { desc = "Fzf: Keymaps" })
vim.keymap.set("n", "<leader>fo", fzf.nvim_options, { desc = "Fzf: Nvim Options" })
vim.keymap.set("n", "<leader>fh", fzf.helptags, { desc = "Fzf: Helptags" })
vim.keymap.set("n", "<leader>fm", fzf.manpages, { desc = "Fzf: Manpages" })

-- Pick Project keymap
vim.keymap.set("n", "<leader>pp", require("config.pick_project").pick_project, { desc = "My custom project picker" })

-- Set keymaps for LSP
vim.keymap.set("n", "<leader>flds", fzf.lsp_document_symbols, { desc = "Fzf: LSP Document Symbols" })
vim.keymap.set("n", "<leader>fldd", fzf.lsp_document_diagnostics, { desc = "Fzf: LSP Document Diagnostics" })
vim.keymap.set("n", "<leader>flws", fzf.lsp_workspace_symbols, { desc = "Fzf: LSP Workspace Symbols" })
vim.keymap.set("n", "<leader>flwd", fzf.lsp_workspace_diagnostics, { desc = "Fzf: LSP Workspace Diagnostics" })
-- TODO: Add more keymaps for LSP related FzfLua pickers
