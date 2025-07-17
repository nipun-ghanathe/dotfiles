return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.opt.termguicolors = true

    vim.keymap.set("n", "<leader>.", "<cmd>NvimTreeFindFileToggle<cr>", { desc = "Toggle Nvim Tree" })

    require("nvim-tree").setup({
      view = {
        float = {
          enable = true,
          quit_on_focus_loss = true,
          open_win_config = {
            relative = "editor",
            border = "rounded",
            width = vim.o.columns,
            height = 20,
            row = 0,
            col = 0,
          },
        },
      },
      update_focused_file = { enable = true },
      actions = {
        open_file = { quit_on_open = true },
        change_dir = {
          enable = true,
          global = true,
          restrict_above_cwd = false,
        },
        use_system_clipboard = true,
      },
      renderer = {
        indent_markers = { enable = true },
        special_files = {},
      },
      git = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = false,
        disable_for_dirs = {},
        timeout = 400,
        cygwin_support = false,
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = false,
        debounce_delay = 500,
        severity = {
          min = vim.diagnostic.severity.HINT,
          max = vim.diagnostic.severity.ERROR,
        },
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      modified = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = false,
      },
      filters = {
        enable = true,
        git_ignored = false,
        dotfiles = false,
        custom = {
          "^.git$",
          "^.venv$",
          "^venv$",
          "^__pycache__$",
          "^.mypy_cache$",
          "^.ipynb_checkpoints$",
        },
        exclude = {},
      },
    })
  end,
}
