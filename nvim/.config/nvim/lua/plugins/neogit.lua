return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  cmd = "Neogit",
  keys = {
    {
      "<leader>ng",
      function()
        require("neogit").open()
      end,
      desc = "Open Neogit",
    },
  },
  opts = {
    disable_hint = true,
    disable_context_highlighting = true,
    remember_settings = false,
    use_per_project_settings = false,
    kind = "split_above_all",
    signs = {
      hunk = { "", "" },
      item = { "", "" },
      section = { "▸", "▾" },
    },
  },
  config = function(_, opts)
    require("neogit").setup(opts)

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("custom_ng_autocmds", { clear = true }),
      pattern = "Neogit*",
      callback = function()
        vim.opt_local.cursorlineopt = "both"
      end,
    })
  end,
}
