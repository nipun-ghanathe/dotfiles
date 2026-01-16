vim.pack.add({ "https://github.com/ibhagwan/fzf-lua" })

require("fzf-lua").setup({ "default" })

require("fzf-lua").register_ui_select()

vim.keymap.set("n", "<leader>pf", require("fzf-lua").git_files, { desc = "Fzf: Project Files" })
vim.keymap.set("n", "<leader>ff", require("fzf-lua").files, { desc = "Fzf: Files" })
vim.keymap.set("n", "<leader>fg", require("fzf-lua").live_grep, { desc = "Fzf: Live Grep" })
vim.keymap.set("n", "<leader>fb", require("fzf-lua").buffers, { desc = "Fzf: Buffers" })
vim.keymap.set("n", "<leader>fcs", require("fzf-lua").colorschemes, { desc = "Fzf: Colorschemes" })
vim.keymap.set("n", "<leader>fch", require("fzf-lua").command_history, { desc = "Fzf: Command History" })
vim.keymap.set("n", "<leader>ft", require("fzf-lua").tagstack, { desc = "Fzf: Tagstack" })
vim.keymap.set("n", "<leader>fk", require("fzf-lua").keymaps, { desc = "Fzf: Keymaps" })
vim.keymap.set("n", "<leader>fo", require("fzf-lua").nvim_options, { desc = "Fzf: Nvim Options" })
vim.keymap.set("n", "<leader>fh", require("fzf-lua").helptags, { desc = "Fzf: Helptags" })
vim.keymap.set("n", "<leader>fm", require("fzf-lua").manpages, { desc = "Fzf: Manpages" })
