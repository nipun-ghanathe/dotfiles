-- Commands to run the code
local runners = {
  lua = "nvim -l",
  python = "uv run",
  sh = "bash",
  javascript = "node",
  html = "xdg-open",
}

-- function to set mappings
local function map(key, term_cmd, opts)
  opts = opts or {}
  local defaults = {
    startinsert = true,
    desc = "Run code via: " .. term_cmd,
  }
  local options = vim.tbl_deep_extend("force", {}, defaults, opts)

  vim.keymap.set("n", "<localleader>r" .. key, function()
    local cmd = runners[vim.bo.filetype] or vim.bo.filetype

    vim.cmd("write")
    vim.cmd(table.concat({
      term_cmd,
      cmd,
      vim.api.nvim_buf_get_name(0),
    }, " "))

    if options.startinsert then
      vim.cmd.startinsert()
    end
  end, { desc = options.desc })
end

-- map <localleader>r{key} to run code using {term_cmd}
map("s", "bo vert term")
map("h", "bo hor term")
map("r", "silent !", { startinsert = false })
