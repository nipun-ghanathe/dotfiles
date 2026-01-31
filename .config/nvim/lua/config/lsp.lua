vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })

------------------------------
--- Setting up LSP Servers ---
------------------------------

-- Create augroup to use with lsp related autocmds
vim.api.nvim_create_augroup("lsp_user_autocmds", { clear = true })

-- Configure LSPs
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      format = {
        enable = true,
        defaultConfig = {
          indent_style = "space",
          indent_size = "2",
          quote_style = "double",

          trailing_table_separator = "smart",
          call_arg_parentheses = "always",

          max_line_length = "120",
          insert_final_newline = "true",
          space_before_inline_comment = "1",
          break_all_list_when_line_exceed = "true",

          align_call_args = "false",
          align_function_params = "false",
          align_continuous_assign_statement = "false",
          align_continuous_rect_table_field = "false",
          align_continuous_line_space = "false",
          align_if_branch = "false",
          align_array_table = "false",
          align_continuous_similar_call_args = "false",
          align_continuous_inline_comment = "false",
        },
      },
    },
  },
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
          path ~= vim.fn.stdpath("config")
          and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
      then
        return
      end
    end
    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
      runtime = {
        version = "LuaJIT",
        path = {
          "lua/?.lua",
          "lua/?/init.lua",
        },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
        },
      },
    })
  end,
})
vim.lsp.config("ruff", {
  on_attach = function()
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = "lsp_user_autocmds",
      pattern = "*.py",
      desc = "Code action on save: Organize imports",
      callback = function()
        vim.lsp.buf.code_action({
          ---@diagnostic disable-next-line: missing-fields
          context = { only = { "source.organizeImports" } },
          apply = true,
        })
      end,
    })
  end,
})
-- TODO: If Neovim gets snippet support remove these lines
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
vim.lsp.config("html", { capabilities = capabilities })
vim.lsp.config("cssls", { capabilities = capabilities })

-- Enable LSPs
vim.lsp.enable({
  "lua_ls",
  "pyright",
  "ruff",
  "emmet_language_server",
  "html",
  "cssls",
  "ts_ls",
})

-----------------------------
--- Configure diagnostics ---
-----------------------------

vim.diagnostic.config({
  underline = false,
  virtual_text = false,
  virtual_lines = false,
  severity_sort = false,
  signs = true,
  float = { source = true },
  jump = { float = true },
})

--------------------
--- LSP mappings ---
--------------------

vim.api.nvim_create_autocmd("LspAttach", {
  group = "lsp_user_autocmds",
  desc = "Set LSP related keymaps",
  callback = function(ev)
    -- Close completion menu if visible and view signature help
    vim.keymap.set({ "i", "s" }, "<c-h>", function()
      vim.lsp.buf.signature_help()
      return vim.fn.pumvisible() ~= 0 and "<c-e>" or ""
    end, { buffer = ev.buf, expr = true, desc = "Signature Help" })
  end,
})
