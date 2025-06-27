return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require("nvim-treesitter.configs").setup({
      highlight = { enable = true },
      indent = { enable = true },
      auto_install = true,
      ensure_installed = {
        "python", "c", "cpp",
        "lua", "html", "css",
        "javascript", "vim", "vimdoc",
      },
    })
  end,
}
