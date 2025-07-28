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
    local cmp = require("cmp")

    -- load the extra snippets from friednly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip").filetype_extend("javascript", { "jsdoc" })
    require("luasnip").filetype_extend("typescript", { "tsdoc" })

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp", keyword_length = 2 },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
      }),
      preselect = "item",
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      mapping = cmp.mapping.preset.insert({
        ["<c-y>"] = cmp.mapping.confirm({ select = true }), -- confirm completion item
        ["<c-space>"] = cmp.mapping(function(fallback) -- toggle completion menu
          if cmp.visible() then
            cmp.abort()
          else
            cmp.complete()
          end
        end, { "i", "c" }),
        ["<c-u>"] = cmp.mapping.scroll_docs(-4), -- scroll up docs
        ["<c-d>"] = cmp.mapping.scroll_docs(4), -- scroll down docs

        -- jump to next snippet placeholder
        ["<c-f>"] = cmp.mapping(function(fallback)
          local luasnip = require("luasnip")
          if luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),

        -- jump to previous snippet placeholder
        ["<c-b>"] = cmp.mapping(function(fallback)
          local luasnip = require("luasnip")
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      formatting = {
        format = function(entry, vim_item)
          -- Source
          vim_item.menu = ({
            nvim_lsp = "[lsp]",
            luasnip = "[luasnip]",
            buffer = "[buffer]",
            path = "[path]",
          })[entry.source.name]
          return vim_item
        end,
      },
    })
  end,
}
