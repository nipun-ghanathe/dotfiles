return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  version = "*",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      -- python = { "black" },
      htmldjango = { "djlint" },
      html = { "prettier" },
      css = { "prettier" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      markdown = { "prettier" },
    },
    default_format_opts = {
      lsp_format = "fallback",
    },
    format_on_save = function(bufnr)
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return { timeout_ms = 500, lsp_format = "fallback" }
    end,
  },
  config = function(_, opts)
    require("conform").setup(opts)

    -- Keymap to format using conform
    vim.keymap.set("n", "<leader>ff", function()
      require("conform").format()
    end, { desc = "Format file using Conform" })

    -- User commands for toggling autoformat-on-save
    vim.api.nvim_create_user_command("FormatDisable", function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, { desc = "Disable autoformat-on-save", bang = true })
    vim.api.nvim_create_user_command("FormatEnable", function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, { desc = "Re-enable autoformat-on-save" })
  end,
}
