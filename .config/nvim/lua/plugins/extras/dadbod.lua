return {
  "kristijanhusak/vim-dadbod-ui",
  enabled = false,
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    { "hrsh7th/nvim-cmp" },
  },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_execute_on_save = 0
  end,
  config = function()
    vim.keymap.set("n", "<c-cr>", "<Plug>(DBUI_ExecuteQuery)")
    vim.keymap.set("n", "<c-s-cr>", "vip<Plug>(DBUI_ExecuteQuery)")

    -- nvim-cmp integration
    require("cmp").setup.filetype({ "sql" }, {
      sources = {
        { name = "vim-dadbod-completion" },
        { name = "path" },
        { name = "buffer" },
      },
    })
  end,
}
