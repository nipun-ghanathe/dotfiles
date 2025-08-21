return {
  "nvim-neorg/neorg",
  version = "*",
  lazy = false,
  opts = {
    load = {
      ["core.defaults"] = {},
      ["core.completion"] = {
        config = {
          engine = "nvim-cmp",
        },
      },
      ["core.concealer"] = {},
      ["core.dirman"] = {
        config = {
          workspaces = {
            notes = vim.fs.abspath("~/notes"),
          },
          default_workspace = "notes",
        },
      },
    },
  },
}
