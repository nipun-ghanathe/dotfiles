-- Create augroup to use with vim-pack related autocmds
vim.api.nvim_create_augroup("pack_user_autocmds", { clear = true })

-- helper functions

local function get_pkg_names()
  local pkg_names = {}
  for _, pkg in ipairs(vim.pack.get()) do
    table.insert(pkg_names, pkg.spec.name)
  end
  return pkg_names
end

-- usercmds

vim.api.nvim_create_user_command("PackList", function()
  -- TODO: Change command if Neovim adds something like vim.pack.list
  vim.pack.update(nil, { offline = true })
end, { desc = "List Packages" })

vim.api.nvim_create_user_command("PackUpdate", function(opts)
  vim.pack.update(#opts.fargs > 0 and opts.fargs or nil)
end, { desc = "Update Packages", nargs = "*", complete = get_pkg_names })

vim.api.nvim_create_user_command("PackDel", function(opts)
  vim.pack.del(opts.fargs, { force = opts.bang })
end, { desc = "Delete Packages (! = force)", nargs = "+", bang = true, complete = get_pkg_names })
