return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      auto_install = true,
      ensure_installed = {
        "python",
        "c",
        "cpp",
        "lua",
        "rust",
        "go",
        "bash",
        "html",
        "css",
        "javascript",
        "typescript",
        "vim",
        "vimdoc",
        "gitignore",
        "markdown",
        "markdown_inline",
        "json",
        "yaml",
      },
    })
  end,
}
