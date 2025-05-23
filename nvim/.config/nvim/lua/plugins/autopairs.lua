return {
  "windwp/nvim-autopairs",
  dependencies = "windwp/nvim-ts-autotag",
  config = function()
    require("nvim-autopairs").setup()
    require("nvim-ts-autotag").setup()
  end,
}
