return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  ---@module "ibl"
  ---@diagnostic disable-next-line: undefined-doc-name
  ---@type ibl.config
  opts = {
    scope = { enabled = false },
    exclude = {
      filetypes = { "dashboard" },
    },
  },
}
