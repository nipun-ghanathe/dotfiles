-----------------------
--- nvim-treesitter ---
-----------------------

-- List parsers
local lang_parsers = {
  "python",
  "c",
  "cpp",
  "lua",
  "rust",
  "go",
  "bash",
  "html",
  "css",
  "javascript",
  "typescript",
  "markdown",
  "json",
  "yaml",
  "toml",
}

-- Install/update parsers along with nvim-treesitter
vim.api.nvim_create_autocmd("PackChanged", {
  group = "pack_user_autocmds",
  desc = "Install/update Treesitter Parsers on PackChanged nvim-treesitter",
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name ~= "nvim-treesitter" then return end
    if not ev.data.active then
      vim.cmd.packadd(name)
    end
    if kind == "install" then
      require("nvim-treesitter").install(lang_parsers, { summary = true })
    elseif kind == "update" then
      vim.cmd("TSUpdate")
    end
  end,
})

-- Add plugin nvim-treesitter
vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

-- Create augroup to use with treesitter related autocmds
vim.api.nvim_create_augroup("treesitter_user_autocmds", { clear = true })

-- Enable treesitter features for installed parsers
vim.api.nvim_create_autocmd("FileType", {
  group = "treesitter_user_autocmds",
  desc = "Enabling Treesitter features",
  pattern = vim.list_extend(vim.deepcopy(lang_parsers), { "sh", "jsonc" }),
  callback = function()
    vim.treesitter.start()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.wo[0][0].foldmethod = "expr"
  end,
})

-------------------------------
--- nvim-treesitter-context ---
-------------------------------

vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter-context" })

vim.api.nvim_set_hl(0, "TreeSitterContextLineNumber", { link = "CursorLineNr" })

-----------------------------------
--- nvim-treesitter-textobjects ---
-----------------------------------

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
vim.keymap.set({ "x", "o" }, "a=", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@assignment.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "i=", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@assignment.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "aa", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@parameter.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ia", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@parameter.inner", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "am", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "im", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ac", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ic", function()
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
vim.keymap.set({ "n", "x", "o" }, "]m", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]c", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]l", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@loop.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]i", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@conditional.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "]M", function()
  require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]C", function()
  require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]L", function()
  require("nvim-treesitter-textobjects.move").goto_next_end("@loop.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]I", function()
  require("nvim-treesitter-textobjects.move").goto_next_end("@conditional.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "[m", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[c", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[l", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@loop.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[i", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@conditional.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "[M", function()
  require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[C", function()
  require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[L", function()
  require("nvim-treesitter-textobjects.move").goto_previous_end("@loop.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[I", function()
  require("nvim-treesitter-textobjects.move").goto_previous_end("@conditional.outer", "textobjects")
end)
