local theme_file = vim.fn.stdpath("data") .. "/theme.txt"
local theme_name = vim.fn.filereadable(theme_file) == 1 and vim.fn.readfile(theme_file)[1] or "tokyonight"

-- Colorscheme plugins
local colorschemes = {
  { "folke/tokyonight.nvim" },
  { "catppuccin/nvim", name = "catppuccin", opts = { term_colors = true } },
  { "Mofiqul/dracula.nvim", opts = { italic_comment = true } },
  { "navarasu/onedark.nvim" },
  { "ellisonleao/gruvbox.nvim" },
  { "shaunsingh/nord.nvim" },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      highlight_groups = {
        StatusLineTerm = { link = "StatusLine" },
        StatusLineTermNC = { link = "StatusLineNC" },
      },
    },
  },
}

-- Function to extract theme name from repo name
local function infer_name(repo)
  return repo:match("/(.+)%.nvim$") or repo:match("/(.+)$")
end

-- Add configuration to the plugins
for _, cs in ipairs(colorschemes) do
  cs.name = cs.name or infer_name(cs[1])
  cs.lazy = theme_name:find(cs.name, 1, true) == nil
  cs.priority = 1000
  cs.config = function(_, opts)
    pcall(function()
      require(cs.name).setup(opts)
    end)
    vim.cmd.colorscheme(theme_name)
  end
end

-- Autocmd to write theme name to theme file whenever colorscheme is changed
vim.api.nvim_create_autocmd({ "ColorScheme" }, {
  desc = "write colorscheme name to stdpath(data)/theme.txt",
  callback = function()
    vim.fn.writefile({ vim.g.colors_name }, theme_file)
  end,
})

return colorschemes
