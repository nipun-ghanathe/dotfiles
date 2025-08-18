return {
  "stevearc/oil.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  lazy = false,
  ---@module 'oil'
  ---@diagnostic disable-next-line: undefined-doc-name
  ---@type oil.SetupOpts
  opts = {
    skip_confirm_for_simple_edits = true,
    keymaps = {
      ["q"] = { "actions.close", mode = "n" },
      ["h"] = { "actions.parent", mode = "n" },
      ["l"] = { "actions.select", mode = "n" },
      ["g."] = { "actions.open_cwd", mode = "n" },
      ["gh"] = { "actions.toggle_hidden", mode = "n" },
    },
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, buffer)
        local always_hidden = {
          [".."] = true,
          ["__pycache__"] = true,
          [".pytest_cache"] = true,
        }
        return always_hidden[name] or false
      end,
    },
    win_options = {
      signcolumn = "yes",
      colorcolumn = "",
    },
  },
  config = function(_, opts)
    require("oil").setup(opts)

    vim.keymap.set("n", "<leader>e", function()
      require("oil").open(nil, nil, nil)
    end, { desc = "Open Oil" })
  end,
}
