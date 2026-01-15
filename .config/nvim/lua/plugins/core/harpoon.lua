return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = "nvim-lua/plenary.nvim",
  keys = {
    "<leader>a",
    "<c-h>",
    "<m-u>",
    "<m-i>",
    "<m-o>",
    "<m-p>",
  },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
      print("Mark added")
    end, { desc = "Add to Harpoon" })
    vim.keymap.set("n", "<c-h>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Open Harpoon Menu" })

    vim.keymap.set("n", "<m-u>", function()
      harpoon:list():select(1)
    end, { desc = "Switch to first file in harpoon" })
    vim.keymap.set("n", "<m-i>", function()
      harpoon:list():select(2)
    end, { desc = "Switch to second file in harpoon" })
    vim.keymap.set("n", "<m-o>", function()
      harpoon:list():select(3)
    end, { desc = "Switch to third file in harpoon" })
    vim.keymap.set("n", "<m-p>", function()
      harpoon:list():select(4)
    end, { desc = "Switch to fourth file in harpoon" })
  end,
}
