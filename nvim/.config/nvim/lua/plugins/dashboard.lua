return {
  "nvimdev/dashboard-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VimEnter",
  config = function()
    require("dashboard").setup({
      theme = "hyper",
      hide = {
        statusline = false,
        tabline = false,
        winbar = false,
      },
      config = {
        header = {
          [[                                                                     ]],
          [[       ████ ██████           █████      ██                     ]],
          [[      ███████████             █████                             ]],
          [[      █████████ ███████████████████ ███   ███████████   ]],
          [[     █████████  ███    █████████████ █████ ██████████████   ]],
          [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
          [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
          [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
          [[                                                                       ]],
        },
        shortcut = {
          {
            icon = " ",
            desc = "Files",
            group = "Label",
            action = "Telescope find_files",
            key = "f",
          },
          {
            icon = "󰏓 ",
            desc = "Projects",
            group = "Keyword",
            action = "lua require('plugins.telescope.pick_project').directory_picker()",
            key = "p",
          },
          { desc = "󰊳 LazySync", group = "@property", action = "Lazy sync", key = "s" },
          {
            icon = "⎋ ",
            desc = "Quit",
            group = "DiagnosticSignError",
            action = "quitall",
            key = "q",
          },
        },
      },
    })

    vim.api.nvim_create_autocmd("FileType", {
      desc = "Configurations for dashboard filetype",
      pattern = "dashboard",
      callback = function()
        vim.keymap.set("n", "q", "<cmd>q<cr>", { buffer = true })
      end,
    })
  end,
}
