require('mason').setup({})

-- Defining variable `capabilities` for later use 
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls', 'basedpyright', -- 'pyright',
    'eslint', 'clangd', 'html', 'cssls',
  },
  handlers = {
    -- default handler
    function(server_name)
      require('lspconfig')[server_name].setup({ capabilities = capabilities })
    end,

    -- custom handlers
    -- <lsp-server-name> = function()
      -- require('lspconfig').<lsp-server-name>.setup({
        -- capabilities = capabilities,
        -- ***your custom settings***
        -- })

    -- basedpyright custom handler
    basedpyright = function()
      require('lspconfig').basedpyright.setup({
        capabilities = capabilities,
        settings = {
          basedpyright = {
            analysis = {
              typeCheckingMode = "basic"
            },
          },
        },
      })
    end,
  },
})
