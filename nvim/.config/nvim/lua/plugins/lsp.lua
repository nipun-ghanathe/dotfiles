return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "mason-org/mason.nvim", version = "^1.0.0" },
    { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
  },

  config = function()
    require("mason").setup()

    -- Defining variable capabilities for later use
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls", "pyright", "clangd",
        "html", "cssls", "eslint",
      },
      handlers = {
        -- default handler
        function(server_name)
          require("lspconfig")[server_name].setup({ capabilities = capabilities })
        end,

        -- custom handlers
        -- <lsp-server-name> = function()
          -- require('lspconfig').<lsp-server-name>.setup({
            -- capabilities = capabilities,
            -- ***your custom settings***
            -- })
      },
    })

    local hover = vim.lsp.buf.hover
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.lsp.buf.hover = function()
        return hover({
            max_width = 100,
            max_height = 14,
            border = "rounded",
        })
    end

    local open_float = vim.diagnostic.open_float
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.diagnostic.open_float = function(opts)
        opts = opts or {}
        opts.border = opts.border or "rounded"
        return open_float(opts)
    end
  end,
}
