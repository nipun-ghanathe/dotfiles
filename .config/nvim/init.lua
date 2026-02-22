require("core.autocmds")
require("core.keymaps")
require("core.options")

require("config.netrw")
require("config.code_runners")

vim.cmd.packadd("nvim.undotree")

require("config.pack")

require("config.editing")
require("config.fzf")
require("config.format")

require("config.lsp")
require("config.treesitter")
require("config.cmp")

vim.cmd.colorscheme("unokai")
