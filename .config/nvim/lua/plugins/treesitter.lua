-- `nvim-treesitter` at the time of this writing is going through
-- breaking changes, and so is `nvim-treesitter-textobjects`, therefore
-- `nvim-treesitter-textobjects` plugin installation and configuration have
-- been commented

return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  dependencies = {
    -- "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-context",
  },
  build = ":TSUpdate",
  -- require("nvim-treesitter.configs").setup({
  --   textobjects = {
  --     select = {
  --       enable = true,
  --       look_ahead = true,
  --       keymaps = {
  --         ["af"] = { query = "@call.outer", desc = "Select outer part of a function call" },
  --         ["if"] = { query = "@call.inner", desc = "Select inner part of a function call" },
  --
  --         ["am"] = { query = "@function.outer", desc = "Select outer part of a method/function def" },
  --         ["im"] = { query = "@function.inner", desc = "Select inner part of a method/function def" },
  --
  --         ["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
  --         ["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
  --
  --         ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
  --         ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },
  --
  --         ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
  --         ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },
  --
  --         ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
  --       },
  --     },
  --     move = {
  --       enable = true,
  --       set_jumps = true,
  --       goto_next_start = {
  --         ["]f"] = { query = "@call.outer", desc = "Next function call" },
  --         ["]m"] = { query = "@function.outer", desc = "Next function def" },
  --         ["]c"] = { query = "@class.outer", desc = "Next class" },
  --         ["]i"] = { query = "@conditional.outer", desc = "Next conditional" },
  --         ["]l"] = { query = "@loop.outer", desc = "Next loop" },
  --
  --         ["]s"] = { query = "@local.scope", query_group = "locals", desc = "Next scope" },
  --       },
  --       goto_next_end = {
  --         ["]F"] = { query = "@call.outer", desc = "End of next function call" },
  --         ["]M"] = { query = "@function.outer", desc = "End of next function def" },
  --         ["]C"] = { query = "@class.outer", desc = "End of next class" },
  --         ["]I"] = { query = "@conditional.outer", desc = "End of next conditional" },
  --         ["]L"] = { query = "@loop.outer", desc = "End of next loop" },
  --       },
  --       goto_previous_start = {
  --         ["[f"] = { query = "@call.outer", desc = "Prev function call" },
  --         ["[m"] = { query = "@function.outer", desc = "Prev function def" },
  --         ["[c"] = { query = "@class.outer", desc = "Prev class" },
  --         ["[i"] = { query = "@conditional.outer", desc = "Prev conditional" },
  --         ["[l"] = { query = "@loop.outer", desc = "Prev loop" },
  --       },
  --       goto_previous_end = {
  --         ["[F"] = { query = "@call.outer", desc = "End of prev function call" },
  --         ["[M"] = { query = "@function.outer", desc = "End of prev function def" },
  --         ["[C"] = { query = "@class.outer", desc = "End of prev class" },
  --         ["[I"] = { query = "@conditional.outer", desc = "End of prev conditional" },
  --         ["[L"] = { query = "@loop.outer", desc = "End of prev loop" },
  --       },
  --     },
  --   },
  -- })
}
