local augroup = vim.api.nvim_create_augroup("user_autocmds", { clear = true })

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  desc = "Highlight on yank",
  callback = function(event)
    vim.hl.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

-- Exit using 'q' on some filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  desc = "Quit some windows simply using 'q'",
  pattern = { "help", "man", "git" },
  callback = function()
    vim.keymap.set("n", "q", "<cmd>q<cr>", { buffer = true })
  end,
})

-- Treesitter: Syntax Highlighting, Indentation and Folds
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  desc = "Enabling Treesitter features",
  -- NOTE: You need to manually install parsers for all these filetypes
  -- using `require("nvim-treesitter").install({ <filetype>... })`
  pattern = {
    "python",
    "c",
    "cpp",
    "lua",
    "rust",
    "go",
    "bash",
    "sh",
    "html",
    "css",
    "javascript",
    "typescript",
    "vim",
    "vimdoc",
    "gitignore",
    "markdown",
    "json",
    "jsonc",
    "yaml",
    "toml",
  },
  callback = function()
    vim.treesitter.start()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    vim.wo[0][0].foldmethod = "expr"
    vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
  end,
})
