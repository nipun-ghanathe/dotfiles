return {
  "rcarriga/nvim-notify",
  config = function()
    vim.opt.termguicolors = true
    vim.notify = require("notify")
    require("notify").setup({
      max_width = math.floor(vim.o.columns / 3),
      render = "minimal",
      stages = "static",
      time_formats = {
        notification = "%H:%M",
        notification_history = "%FT%T",
      },
    })
  end,
}
