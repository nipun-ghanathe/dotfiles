return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require("nvim-treesitter.configs").setup({
      auto_install = true,
      highlight = { enable = true, },
      ensure_installed = {
        "python", "c", "cpp",
        "lua", "html", "css",
        "javascript", "vim", "vimdoc",
      },
    })
  end,
}
