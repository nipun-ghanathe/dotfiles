return {
  "gbprod/nord.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    diff = { mode = "fg" },
    errors = { mode = "fg" },
    search = { theme = "vscode" },
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      functions = { italic = true, bold = true },
      variables = {},
    },
  },
  config = function(_, opts)
    require("nord").setup(opts)
    vim.cmd.colorscheme("nord")
  end,
}
