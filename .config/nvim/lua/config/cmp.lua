vim.pack.add({
  "https://github.com/hrsh7th/nvim-cmp",
  "https://github.com/hrsh7th/cmp-nvim-lsp",
  "https://github.com/hrsh7th/cmp-buffer",
  "https://github.com/hrsh7th/cmp-path",
  "https://github.com/saadparwaiz1/cmp_luasnip",
  "https://github.com/L3MON4D3/LuaSnip",
})

--------------------------
--- Configure nvim-cmp ---
--------------------------

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
      require("luasnip").lsp_expand(args.body)
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

-------------------------
--- Configure luasnip ---
-------------------------

-- load snippets from rtp/<folder-with-package.json> (friendly-snippets)
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip").filetype_extend("javascript", { "jsdoc" })
require("luasnip").filetype_extend("typescript", { "tsdoc" })

-- snippets from rtp/luasnippets (my-custom-snippets)
require("luasnip.loaders.from_lua").lazy_load()

-- User command to edit snippets
-- open the snippets file in a vertical split
vim.api.nvim_create_user_command("LuaSnipEdit", function()
  require("luasnip.loaders").edit_snippet_files({
    edit = function(file)
      vim.cmd("vsp " .. file)
    end,
  })
end, {})
