return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    -- "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python", --optional
  },
  lazy = "VeryLazy",
  ft = "python",
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
        -- Select venv using venv-selector.nvim
        local venv_selector = require("venv-selector")

        -- Check if venv-selector has selected a venv from cache
        if venv_selector.venv() == nil then
          local venv_path = vim.fn.getcwd() .. "/.venv/bin/python"
          if vim.fn.executable(venv_path) == 1 then
            venv_selector.activate_from_path(venv_path)
            print("venv activation function run")
          end
        end
      end,
    }),
  },
}
