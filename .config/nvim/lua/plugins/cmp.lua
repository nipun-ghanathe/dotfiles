return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
  },
  event = "InsertEnter",
  config = function()
    local cmp = require("cmp")

    cmp.setup({
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
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
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

        -------------------------
        -- Set some other shortcuts, I use C-j and C-k for navigating
        -- cells in py:percent files
        -------------------------
        -- -- cycle forward through choice nodes
        -- ["<c-j>"] = cmp.mapping(function(fallback)
        --   local luasnip = require("luasnip")
        --   if luasnip.choice_active() then
        --     luasnip.change_choice(1)
        --   else
        --     fallback()
        --   end
        -- end, { "i", "s" }),
        --
        -- -- cycle backward through choice nodes
        -- ["<c-k>"] = cmp.mapping(function(fallback)
        --   local luasnip = require("luasnip")
        --   if luasnip.choice_active() then
        --     luasnip.change_choice(-1)
        --   else
        --     fallback()
        --   end
        -- end, { "i", "s" }),
      }),
    })

    -- Set-up vim-dadbod completion for SQL
    cmp.setup.filetype({ "sql" }, {
      sources = {
        { name = "vim-dadbod-completion" },
        { name = "path" },
        { name = "buffer" },
      },
    })
  end,
}
