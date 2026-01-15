return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  event = "VeryLazy",
  cmd = "Telescope",
  config = function()
    require("telescope").setup({
      defaults = {
        file_ignore_patterns = {
          "^__pycache__/",
          "^node_modules/",
          "^%.git/",
          "^%.venv/",
        },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          follow = true,
        },
        buffers = {
          mappings = {
            i = { ["<c-d>"] = "delete_buffer" },
            n = { ["d"] = "delete_buffer" },
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })
    require("telescope").load_extension("fzf")

    vim.keymap.set("n", "<c-p>", function()
      require("telescope.builtin").find_files()
    end, { desc = "Telescope: Project files" })
    vim.keymap.set("n", "<leader>fg", function()
      require("telescope.builtin").live_grep()
    end, { desc = "Telescope: Find Grep" })
    vim.keymap.set("n", "<leader>fb", function()
      require("telescope.builtin").buffers()
    end, { desc = "Telescope: Buffers List" })
    vim.keymap.set("n", "<leader>fh", function()
      require("telescope.builtin").help_tags()
    end, { desc = "Telescope: Find Help" })
    vim.keymap.set("n", "<leader>fk", function()
      require("telescope.builtin").keymaps()
    end, { desc = "Telescope: Find Keymaps" })

    vim.keymap.set("n", "<leader>pp", function()
      require("plugins.core.telescope.pick_project").directory_picker()
    end, { desc = "Pick Project" })
    vim.keymap.set("n", "<leader>ptp", function()
      require("plugins.core.telescope.pick_project").directory_picker("tcd")
    end, { desc = "Pick Tab Project" })
    vim.keymap.set("n", "<leader>plp", function()
      require("plugins.core.telescope.pick_project").directory_picker("lcd")
    end, { desc = "Pick Window Project" })
  end,
}
