return {
  "linux-cultist/venv-selector.nvim",
  lazy = false,
  ft = "python",
  branch = "regexp", -- This is the regexp branch, use this for the new version
  keys = {
    { "<localleader>v", "<cmd>VenvSelect<cr>", desc = "Python Venv Selector" },
  },
  ---@diagnostic disable-next-line: undefined-doc-name
  ---@type venv-selector.Config
  opts = {
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        ---@diagnostic disable-next-line: need-check-nil
        if client.name == "pyright" then
          local venv_selector = require("venv-selector")
          if venv_selector.venv() == nil then
            local venv_path = vim.fn.getcwd() .. "/.venv/bin/python"
            if vim.fn.executable(venv_path) == 1 then
              venv_selector.activate_from_path(venv_path)
              print("Tried manually attaching to workspace venv at: " .. venv_path)
            end
          end
        end
      end,
    })
  },
}
