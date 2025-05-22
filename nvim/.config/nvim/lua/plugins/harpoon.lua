return {
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>",        "n" },
      { "<c-e>",     "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "n" },

      { "<c-h>",     "<cmd>lua require('harpoon.ui').nav_next()<cr>", "n" },
      { "<c-l>",     "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "n" },

      { "<c-1>",     "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",         "n" },
      { "<c-2>",     "<cmd>lua require('harpoon.ui').nav_file(2)<cr>",         "n" },
      { "<c-3>",     "<cmd>lua require('harpoon.ui').nav_file(3)<cr>",         "n" },
      { "<c-4>",     "<cmd>lua require('harpoon.ui').nav_file(4)<cr>",         "n" },
      { "<c-5>",     "<cmd>lua require('harpoon.ui').nav_file(5)<cr>",         "n" },
      { "<c-6>",     "<cmd>lua require('harpoon.ui').nav_file(6)<cr>",         "n" },
      { "<c-7>",     "<cmd>lua require('harpoon.ui').nav_file(7)<cr>",         "n" },
      { "<c-8>",     "<cmd>lua require('harpoon.ui').nav_file(8)<cr>",         "n" },
      { "<c-9>",     "<cmd>lua require('harpoon.ui').nav_file(9)<cr>",         "n" },
      { "<c-0>",     "<cmd>lua require('harpoon.ui').nav_file(10)<cr>",        "n" },
    },
  },
}
