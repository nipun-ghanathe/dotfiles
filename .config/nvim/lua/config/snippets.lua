vim.pack.add({ "https://github.com/nvim-mini/mini.snippets" })

require("mini.snippets").setup({
  -- Use Neovim's built-ins to insert snippet
  expand = {
    insert = function(snippet, _)
      vim.snippet.expand(snippet.body)
    end,
  },
  -- Disable default mappings
  mappings = { expand = "", jump_next = "", jump_prev = "", stop = "" },
  -- Define how to load snippets
  snippets = {
    require("mini.snippets").gen_loader.from_file("~/.config/nvim/snippets/global.json"),
    require("mini.snippets").gen_loader.from_lang(),
  },
})

-- Start completion LSP server
require("mini.snippets").start_lsp_server()
