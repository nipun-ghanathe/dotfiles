return {
  "hrsh7th/nvim-cmp",
  enabled = false,
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
  },
  event = "InsertEnter",
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      -- For debugging
      -- formatting = {
      --   format = function(entry, vim_item)
      --     vim_item.menu = "[" .. entry.source.name .. "]"
      --     return vim_item
      --   end,
      -- },

      sources = cmp.config.sources({
        { name = "nvim_lsp", keyword_length = 2 },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
      }),

      snippet = {
        expand = function(args)
          -- require("luasnip").lsp_expand(args.body)
          vim.snippet.expand(args.body)
        end,
      },

      mapping = cmp.mapping.preset.insert({
        ["<c-space>"] = cmp.mapping.complete(),
        ["<c-e>"] = cmp.mapping.abort(),
        ["<c-y>"] = cmp.mapping.confirm({ select = true }),

        -- mappings for jumping through snippet placeholders
        ["<tab>"] = cmp.mapping(function(fallback)
          if require("luasnip").locally_jumpable(1) then
            require("luasnip").jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<s-tab>"] = cmp.mapping(function(fallback)
          if require("luasnip").locally_jumpable(-1) then
            require("luasnip").jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
    })
  end,
}
