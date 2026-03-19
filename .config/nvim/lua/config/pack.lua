-- Create augroup to use with vim-pack related autocmds
vim.api.nvim_create_augroup('pack_user_autocmds', { clear = true })

-- helper functions

local function get_pkg_names(starts_with)
  return vim.iter(vim.pack.get())
      :map(function(x) return x.spec.name end)
      :filter(function(name)
        if not starts_with or starts_with == '' then
          return true
        end
        return string.sub(name, 1, #starts_with) == starts_with
      end)
      :totable()
end

local function get_inactive_pkg_names(starts_with)
  return vim.iter(vim.pack.get())
      :filter(function(x) return not x.active end)
      :map(function(x) return x.spec.name end)
      :filter(function(name)
        if not starts_with or starts_with == '' then
          return true
        end
        return string.sub(name, 1, #starts_with) == starts_with
      end)
      :totable()
end

-- usercmds

vim.api.nvim_create_user_command('PackList', function()
  -- TODO: Change command if Neovim adds something like vim.pack.list
  vim.pack.update(nil, { offline = true })
end, { desc = 'List Packages' })

vim.api.nvim_create_user_command('PackUpdate', function(opts)
  vim.pack.update(#opts.fargs > 0 and opts.fargs or nil)
end, { desc = 'Update Packages', nargs = '*', complete = get_pkg_names })

vim.api.nvim_create_user_command('PackDel', function(opts)
  local pkgs = not vim.tbl_isempty(opts.fargs)
      and opts.fargs or get_inactive_pkg_names()
  vim.pack.del(pkgs, { force = opts.bang })
end, { desc = 'Delete Packages (! = force)', nargs = '*', bang = true, complete = get_pkg_names })
