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

local ts = require("nvim-treesitter-textobjects")
local select = require("nvim-treesitter-textobjects.select")
local move = require("nvim-treesitter-textobjects.move")

ts.setup({
  select = { lookahead = true },
  move = { set_jumps = true },
})

local textobjects = {
  ["f"] = "call",
  ["m"] = "function",
  ["k"] = "class",
  ["l"] = "loop",
  ["i"] = "conditional",
}

local function map_select(lhs, query)
  vim.keymap.set({ "x", "o" }, lhs, function()
    select.select_textobject(query, "textobjects")
  end)
end

local function map_move(lhs, fn, query)
  vim.keymap.set({ "n", "x", "o" }, lhs, function()
    fn(query, "textobjects")
  end)
end

for key, node in pairs(textobjects) do
  local outer = "@" .. node .. ".outer"
  local inner = "@" .. node .. ".inner"

  map_select("a" .. key, outer)
  map_select("i" .. key, inner)

  map_move("]" .. key, move.goto_next_start, outer)
  map_move("[" .. key, move.goto_previous_start, outer)
  map_move("]" .. key:upper(), move.goto_next_end, outer)
  map_move("[" .. key:upper(), move.goto_previous_end, outer)
end
