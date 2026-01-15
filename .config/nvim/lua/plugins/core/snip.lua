return {
  "L3MON4D3/LuaSnip",
  version = "*",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  lazy = true,
  config = function()
    -- snippets from rtp/<folder-with-package.json> (friendly-snippets)
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
  end,
}
