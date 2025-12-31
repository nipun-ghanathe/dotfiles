return {
  "L3MON4D3/LuaSnip",
  version = "*",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "saadparwaiz1/cmp_luasnip",
  },
  lazy = true,
  config = function()
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
}
