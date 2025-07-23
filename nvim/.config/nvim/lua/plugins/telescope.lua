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
  keys = {
    { "<c-p>", require("telescope.builtin").find_files, desc = "Telescope: Project files" },
    { "<leader>fg", require("telescope.builtin").live_grep, desc = "Telescope: Find Grep" },
    { "<leader>bl", require("telescope.builtin").buffers, desc = "Telescope: Buffers List" },
    { "<leader>fh", require("telescope.builtin").help_tags, desc = "Telescope: Find Help" },
    { "<leader>fk", require("telescope.builtin").keymaps, desc = "Telescope: Find Keymaps" },
  },
  opts = {
    defaults = {
      file_ignore_patterns = {
        "__pycache__",
        "%.git",
        "%.venv",
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
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("ui-select")
  end,
}
