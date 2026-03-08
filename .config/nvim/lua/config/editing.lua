-- surround
vim.pack.add({ "https://github.com/kylechui/nvim-surround" })
require("nvim-surround").setup()

-- treesitter-context
vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter-context" })

-- autopairs
vim.pack.add({ "https://github.com/windwp/nvim-autopairs" })

local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")

npairs.setup()

npairs.add_rules({
  Rule("%", "%", "htmldjango"),
})

vim.api.nvim_create_user_command("AutopairsToggle", function()
  npairs.toggle()
  print("Autopairs enabled: " .. tostring(not npairs.state.disabled))
end, { desc = "Toggle Autopairs" })
vim.keymap.set("n", "<leader>tp", "<cmd>AutopairsToggle<cr>", { desc = "Toggle Autopairs" })
