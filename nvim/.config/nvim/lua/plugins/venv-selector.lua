return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    -- "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python", --optional
  },
  lazy = "VeryLazy",
  -- ft = { "python" },
  branch = "regexp", -- This is the regexp branch, use this for the new version
  keys = {
    { "<leader>v", "<cmd>VenvSelect<cr>" },
  },
  ---@diagnostic disable-next-line: undefined-doc-name
  ---@type venv-selector.Config
  opts = {
    -- Your settings go here
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        -- check whether or not the attached lsp client is pyright
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        ---@diagnostic disable-next-line: need-check-nil
        if client.name ~= "pyright" then return end

        -- Select venv using venv-selector.nvim
        local venv_selector = require("venv-selector")

        -- Check if venv-selector has checked a venv from cache
        if venv_selector.venv() == nil then
          local venv_path = vim.fn.getcwd() .. "/.venv/bin/python"
          if vim.fn.executable(venv_path) == 1 then
            venv_selector.activate_from_path(venv_path)
          end
        end
      end,
    }),
  },
}
