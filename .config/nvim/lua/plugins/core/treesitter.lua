return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        desc = "Enabling Treesitter features",
        -- NOTE: You need to manually install parsers for all these filetypes
        -- using `require("nvim-treesitter").install({ <filetype>... })`
        -- see ~/dotfiles/README.md
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
          vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
          vim.wo[0][0].foldmethod = "expr"
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      vim.api.nvim_set_hl(0, "TreeSitterContextLineNumber", { link = "CursorLineNr" })

      vim.keymap.set("n", "[c", function()
        require("treesitter-context").go_to_context(vim.v.count1)
      end, { desc = "Go to context" })
    end,
  },
}
