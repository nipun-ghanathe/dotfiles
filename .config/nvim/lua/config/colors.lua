vim.pack.add({ 'https://github.com/rebelot/kanagawa.nvim' })

require('kanagawa').setup({
  compile = true,
  undercurl = false,
  colors = {
    theme = {
      all = {
        ui = {
          bg_gutter = 'none',
        },
      },
    },
  },
})

vim.cmd.colorscheme('kanagawa')
