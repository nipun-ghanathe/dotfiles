return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  event = { "BufReadPre " .. vim.fn.expand("~/obsidian-vault/") },
  -- Replace the above line with `ft = "markdown"` if you want to load obsidian.nvim for all markdown files
  dependencies = { "nvim-lua/plenary.nvim" },
  -- opts = {
  --   workspaces = {
  --     {
  --       name = "personal",
  --       path = "~/vaults/personal",
  --     },
  --     {
  --       name = "work",
  --       path = "~/vaults/work",
  --     },
  --   },
  --
  --   -- see below for full list of options 👇
  -- },
}
