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
  "vim",
  "vimdoc",
  "gitignore",
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
vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
})

-- Create augroup to use with treesitter related autocmds
vim.api.nvim_create_augroup("treesitter_user_autocmds", { clear = true })

-- Enable treesitter features for installed parsers
vim.api.nvim_create_autocmd("FileType", {
  group = "treesitter_user_autocmds",
  desc = "Enabling Treesitter features",
  -- NOTE: lang_parsers gets mutated
  pattern = vim.list_extend(lang_parsers, { "sh", "jsonc" }),
  callback = function()
    vim.treesitter.start()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.wo[0][0].foldmethod = "expr"
  end,
})

----------------------------------------
--- Treesitter-context configuration ---
----------------------------------------

vim.api.nvim_set_hl(0, "TreeSitterContextLineNumber", { link = "CursorLineNr" })
