vim.pack.add({ 'https://github.com/shatur/neovim-ayu' })

local colors = require('ayu.colors')
colors.generate()

require('ayu').setup({
  overrides = {
    LineNr = { fg = colors.guide_active },
  },
})

vim.cmd.colorscheme('ayu')
