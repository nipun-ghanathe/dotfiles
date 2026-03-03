vim.pack.add({ "https://github.com/uga-rosa/ccc.nvim" })

local ccc = require("ccc")

ccc.setup({
  inputs = {
    ccc.input.hsl,
    ccc.input.rgb,
  },
})

-- Prepend CccPick to the PopUp menu
vim.cmd([[
  amenu 0.1 PopUp.CccPick <cmd>CccPick<CR>
  amenu 0.2 PopUp.-Sep- <Nop>
]])
