return {
  "gbprod/nord.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("nord").setup({
      diff = { mode = "fg" },
      errors = { mode = "fg" },
      search = { theme = "vscode" },
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = { italic = true, bold = true },
        variables = {},
      },
    })
    vim.cmd.colorscheme("nord")
  end,
}
