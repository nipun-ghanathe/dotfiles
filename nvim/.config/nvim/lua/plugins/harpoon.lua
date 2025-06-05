return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()

      vim.keymap.set("n", "<leader>a", function() harpoon:list():add(); print("Mark added") end)
      vim.keymap.set("n", "<c-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

      -- Toggle previous and next buffers stored within Harpoon list
      vim.keymap.set("n", "<c-[>", function() harpoon:list():prev() end)
      vim.keymap.set("n", "<c-]>", function() harpoon:list():next() end)

      vim.keymap.set("n", "<c-j>", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<c-k>", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<c-l>", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<c-;>", function() harpoon:list():select(4) end)

      vim.keymap.set("n", "<c-1>", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<c-2>", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<c-3>", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<c-4>", function() harpoon:list():select(4) end)
      vim.keymap.set("n", "<c-5>", function() harpoon:list():select(5) end)
      vim.keymap.set("n", "<c-6>", function() harpoon:list():select(6) end)
      vim.keymap.set("n", "<c-7>", function() harpoon:list():select(7) end)
      vim.keymap.set("n", "<c-8>", function() harpoon:list():select(8) end)
      vim.keymap.set("n", "<c-9>", function() harpoon:list():select(9) end)
      vim.keymap.set("n", "<c-0>", function() harpoon:list():select(10) end)
    end,
}
