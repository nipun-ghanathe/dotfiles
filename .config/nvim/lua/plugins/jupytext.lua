return {
  "goerz/jupytext.nvim",
  cond = function()
    local fname = vim.api.nvim_buf_get_name(0)
    return fname:match("%.ipynb$")
  end,
  opts = {
    format = "py:percent",
  },
}
