return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    vim.keymap.set("n", "<leader>a", function() harpoon:list():add(); print("Mark added") end, { desc = "Add to Harpoon" })
    vim.keymap.set("n", "<c-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Open Harpoon Menu" })

    vim.keymap.set("n", "<m-j>", function() harpoon:list():select(1) end, { desc = "Switch to first file in harpoon" })
    vim.keymap.set("n", "<m-k>", function() harpoon:list():select(2) end, { desc = "Switch to second file in harpoon" })
    vim.keymap.set("n", "<m-l>", function() harpoon:list():select(3) end, { desc = "Switch to third file in harpoon" })
    vim.keymap.set("n", "<m-;>", function() harpoon:list():select(4) end, { desc = "Switch to fourth file in harpoon" })
  end,
}
