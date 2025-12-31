-- Run only if Neovide
if not vim.g.neovide then
  return
end

---------------
--- Options ---
---------------

-- vim.g.neovide_opacity = 0.8  -- overall opacity
-- vim.g.neovide_normal_opacity = 0.8  -- opacity for normal background color

-- vim.g.neovide_text_gamma = 0.0
-- vim.g.neovide_text_contrast = 0.5

vim.g.neovide_cursor_animation_length = 0.08
vim.g.neovide_cursor_trail_size = 0

vim.g.neovide_cursor_unfocused_outline_width = 0.08

vim.g.neovide_hide_mouse_when_typing = true

---------------
--- Keymaps ---
---------------

-- Scaling
vim.g.neovide_scale_factor = 1.0
local function change_scale_factor(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + delta
end
vim.keymap.set("n", "<c-=>", function()
  change_scale_factor(0.25)
end)
vim.keymap.set("n", "<c-->", function()
  change_scale_factor(-0.25)
end)
vim.keymap.set("n", "<c-s-bs>", function()
  vim.g.neovide_scale_factor = 1.0
end)
