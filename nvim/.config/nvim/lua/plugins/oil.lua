return {
  "stevearc/oil.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  lazy = false,
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
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
  },
  config = function(_, opts)
    require("oil").setup(opts)

    vim.keymap.set("n", "<leader>e", function()
      require("oil").open_float(nil, {
        preview = {
          horizontal = true,
        },
      })
    end, { desc = "Open Oil" })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "oil",
      desc = "Settings for the Oil buffer.",
      callback = function()
        vim.opt_local.colorcolumn = ""

        -- for safety (line numbers were causing problems)
        vim.opt_local.number = true
        vim.opt_local.relativenumber = true
      end,
    })
  end,
}
