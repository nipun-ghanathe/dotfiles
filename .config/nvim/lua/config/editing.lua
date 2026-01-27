----------------
--- Surround ---
----------------

vim.pack.add({ "https://github.com/kylechui/nvim-surround" })
require("nvim-surround").setup()

--------------------------
--- treesitter-context ---
--------------------------

vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter-context" })
vim.api.nvim_set_hl(0, "TreeSitterContextLineNumber", { link = "CursorLineNr" })

-------------------
--- Textobjects ---
-------------------

vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", version = "main" },
})

-- configuration
require("nvim-treesitter-textobjects").setup({
  select = { lookahead = true },
  move = { set_jumps = true },
})

-- select keymaps
vim.keymap.set({ "x", "o" }, "af", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@call.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "if", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@call.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "aa", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@parameter.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ia", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@parameter.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "a=", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@assignment.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "i=", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@assignment.inner", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "am", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "im", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ak", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ik", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "al", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@loop.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "il", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@loop.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ai", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@conditional.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ii", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@conditional.inner", "textobjects")
end)

-- move keymaps
vim.keymap.set({ "n", "x", "o" }, "]f", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@call.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]m", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]k", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]l", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@loop.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]i", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@conditional.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "]F", function()
  require("nvim-treesitter-textobjects.move").goto_next_end("@call.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]M", function()
  require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]K", function()
  require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]L", function()
  require("nvim-treesitter-textobjects.move").goto_next_end("@loop.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]I", function()
  require("nvim-treesitter-textobjects.move").goto_next_end("@conditional.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "[f", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@call.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[m", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[k", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[l", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@loop.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[i", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@conditional.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "[F", function()
  require("nvim-treesitter-textobjects.move").goto_previous_end("@call.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[M", function()
  require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[K", function()
  require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[L", function()
  require("nvim-treesitter-textobjects.move").goto_previous_end("@loop.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[I", function()
  require("nvim-treesitter-textobjects.move").goto_previous_end("@conditional.outer", "textobjects")
end)
