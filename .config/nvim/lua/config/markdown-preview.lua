-- Build markdown-preview on install/update
vim.api.nvim_create_autocmd("PackChanged", {
  group = "pack_user_autocmds",
  desc = "Build markdown-preview on install/update",
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name ~= "markdown-preview.nvim" or (kind ~= "install" and kind ~= "update") then
      return
    end
    if not ev.data.active then
      vim.cmd.packadd(name)
    end
    vim.system({ "npm", "install" }, { cwd = ev.data.path .. "/app" })
  end,
})

-- Configuration
-- vim.g.mkdp_auto_start = 1
vim.g.mkdp_auto_close = 0
vim.g.mkdp_combine_preview = 1
vim.g.mkdp_preview_options = { sync_scroll_type = "top" }

-- Add plugin
vim.pack.add({ "https://github.com/iamcco/markdown-preview.nvim" })
