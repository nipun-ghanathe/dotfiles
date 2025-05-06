return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",

    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  },

  event = "InsertEnter",

  config = function()
    local cmp = require('cmp')

    -- load the extra snippets from friendly-snippets
    require('luasnip.loaders.from_vscode').lazy_load()

    cmp.setup({
      snippet    = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      sources    = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer' },
      }),
      window     = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      preselect  = 'item',
      completion = {
        completeopt = 'menu,menuone,noinsert'
      },
      mapping    = cmp.mapping.preset.insert({
        ['<c-y>'] = cmp.mapping.confirm({ select = true }),      -- confirm completion item
        ['<c-space>'] = cmp.mapping.complete({ select = true }), -- trigger completion menu
        ['<c-u>'] = cmp.mapping.scroll_docs(-4),                 -- scroll up
        ['<c-d>'] = cmp.mapping.scroll_docs(4),                  -- scroll up

        -- jump to the next snippet placeholder
        ['<C-f>'] = cmp.mapping(function(fallback)
          local luasnip = require('luasnip')
          if luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { 'i', 's' }),

        -- jump to the previous snippet placeholder
        ['<C-b>'] = cmp.mapping(function(fallback)
          local luasnip = require('luasnip')
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),
    })
  end,
}
