require("core.autocmds")
require("core.keymaps")
require("core.options")

require("config.netrw")
require("config.terminal")

vim.cmd.packadd("nvim.undotree")

require("config.pack")

require("config.editing")
require("config.fzf")
require("config.format")
-- require("config.nvim_cmp")

require("config.lsp")
require("config.treesitter")
require("config.cmp")

require("config.colors")
