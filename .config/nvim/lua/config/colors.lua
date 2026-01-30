-- theme switcher script to change themes of other apps alongside neovim
local theme_switcher = vim.uv.os_homedir() .. "/dotfiles/.config/hypr/scripts/theme-switcher.sh"

local theme_file = vim.fn.stdpath("data") .. "/theme.txt"
local theme_name = vim.fn.filereadable(theme_file) == 1 and vim.fn.readfile(theme_file)[1] or "default"

-- Add themes
vim.pack.add({
  "https://github.com/folke/tokyonight.nvim",
  "https://github.com/navarasu/onedark.nvim",
  "https://github.com/Mofiqul/dracula.nvim",
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
  { src = "https://github.com/rose-pine/neovim", name = "rose-pine" },
})

-- augroup for colorscheme related autocmds
vim.api.nvim_create_augroup("colorscheme_user_autocmds", { clear = true })

-- function to create autocmd configuring colorscheme before loading
local function configure_cs(name, config, pattern)
  vim.api.nvim_create_autocmd("ColorSchemePre", {
    pattern = pattern or (name .. "*"),
    group = "colorscheme_user_autocmds",
    callback = function()
      require(name).setup(config)
    end,
  })
end

-- Configure themes
configure_cs("dracula", { italic_comment = true })
configure_cs("catppuccin", {
  flavour = "macchiato",
  term_colors = true,
})
configure_cs("rose-pine", {
  variant = "moon",
  highlight_groups = {
    StatusLineTerm = { link = "StatusLine" },
    StatusLineTermNC = { link = "StatusLineNC" },
  },
})

-- Load theme
vim.cmd.colorscheme(theme_name)

-- Autocmd to execute theme_switcher
vim.api.nvim_create_autocmd("ColorScheme", {
  group = "colorscheme_user_autocmds",
  desc = "run theme-switcher",
  callback = function(ev)
    vim.system({ theme_switcher, ev.match })
  end,
})
