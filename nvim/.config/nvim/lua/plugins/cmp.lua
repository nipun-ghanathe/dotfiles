return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    {
      "L3MON4D3/LuaSnip",
      version = "*",
      dependencies = {
        "rafamadriz/friendly-snippets",
        "saadparwaiz1/cmp_luasnip",
      },
      config = function()
        -- Every unspecified option will be set to default.
        require("luasnip").config.set_config({
          history = true,
          updateevents = "TextChanged,TextChangedI",
          ext_opts = {
            [require("luasnip.util.types").choiceNode] = {
              active = {
                virt_text = { { "choiceNode", "Comment" } },
              },
            },
          },
        })

        -- User command to edit snippets
        vim.api.nvim_create_user_command("LuaSnipEdit", function()
          require("luasnip.loaders").edit_snippet_files({
            edit = function(file)
              -- Open the snippets file in a vertical split
              vim.cmd("vsp " .. file)
            end,
          })
        end, {})

        -- snippets from rtp/<folder-with-package.json> (friendly-snippets)
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip").filetype_extend("javascript", { "jsdoc" })
        require("luasnip").filetype_extend("typescript", { "tsdoc" })

        -- snippets from rtp/luasnippets (my-custom-snippets)
        require("luasnip.loaders.from_lua").lazy_load()
      end,
    },
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

        -- cycle forward through choice nodes
        ["<c-j>"] = cmp.mapping(function(fallback)
          local luasnip = require("luasnip")
          if luasnip.choice_active() then
            luasnip.change_choice(1)
          else
            fallback()
          end
        end, { "i", "s" }),

        -- cycle backward through choice nodes
        ["<c-k>"] = cmp.mapping(function(fallback)
          local luasnip = require("luasnip")
          if luasnip.choice_active() then
            luasnip.change_choice(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
    })
  end,
}
