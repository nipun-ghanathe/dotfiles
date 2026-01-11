return {
  "kristijanhusak/vim-dadbod-ui",
  enabled = false,
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
  },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1

    vim.g.db_ui_execute_on_save = 0

    vim.g.dbs = {
      { name = "analysis-pracsql", url = "postgres://nipun@localhost/analysis" },
      { name = "startersql-cwh", url = "mysql://nipun@localhost/startersql" },
    }
  end,
  config = function()
    vim.keymap.set("n", "<c-cr>", "<Plug>(DBUI_ExecuteQuery)")
    vim.keymap.set("n", "<c-s-cr>", "vip<Plug>(DBUI_ExecuteQuery)")
  end,
}
