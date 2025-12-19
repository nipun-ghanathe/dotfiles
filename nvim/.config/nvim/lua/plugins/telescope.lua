return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    "nvim-telescope/telescope-ui-select.nvim",
  },
  event = "VeryLazy",
  cmd = "Telescope",
  keys = {
    {
      "<c-p>",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Telescope: Project files",
    },
    {
      "<leader>fg",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Telescope: Find Grep",
    },
    {
      "<leader>fb",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "Telescope: Buffers List",
    },
    {
      "<leader>fh",
      function()
        require("telescope.builtin").help_tags()
      end,
      desc = "Telescope: Find Help",
    },
    {
      "<leader>fk",
      function()
        require("telescope.builtin").keymaps()
      end,
      desc = "Telescope: Find Keymaps",
    },
  },
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
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    })
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("ui-select")

    vim.keymap.set("n", "<leader>pp", function()
      require("plugins.telescope.pick_project").directory_picker()
    end, { desc = "Pick Project" })
    vim.keymap.set("n", "<leader>ptp", function()
      require("plugins.telescope.pick_project").directory_picker("tcd")
    end, { desc = "Pick Tab Project" })
    vim.keymap.set("n", "<leader>plp", function()
      require("plugins.telescope.pick_project").directory_picker("lcd")
    end, { desc = "Pick Window Project" })
  end,
}
