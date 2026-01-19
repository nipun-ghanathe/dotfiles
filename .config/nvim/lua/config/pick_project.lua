local fzf = require("fzf-lua")

local M = {}

local function get_sub_dirs(root_dir, opts)
  opts = opts or {}

  local cmd = { "fd", ".", root_dir, "--type", "d" }
  if opts.mindepth then
    vim.list_extend(cmd, { "--min-depth", tostring(opts.mindepth) })
  end
  if opts.maxdepth then
    vim.list_extend(cmd, { "--max-depth", tostring(opts.maxdepth) })
  end

  local result = vim.system(cmd, { text = true }):wait()

  if result.code ~= 0 then
    return {}
  end
  local dirs = vim.split(result.stdout, "\n", { trimempty = true })
  return dirs
end

M.pick_dir = function(dir_list, opts)
  opts = opts or {}

  local base_opts = {
    prompt = "> ",
    fzf_opts = {
      ["--preview"] = "ls --color=yes --group-directories-first --format=single-column -- {}",
    },
    winopts = {
      preview = {
        horizontal = "right:30%",
        vertical = "down:35%",
      },
    },
    actions = {
      -- cd into directory and open files picker
      ["default"] = function(selected)
        vim.cmd.cd(selected[1])
        fzf.files()
      end,
      -- cd into directory and :Explore
      ["ctrl-e"] = function(selected)
        vim.cmd.cd(selected[1])
        vim.cmd.Ex()
      end,
      -- tcd into directory
      ["ctrl-t"] = function(selected)
        vim.cmd.tcd(selected[1])
      end,
      -- lcd into directory
      ["ctrl-l"] = function(selected)
        vim.cmd.lcd(selected[1])
      end,
    },
  }

  local opts_merged = vim.tbl_deep_extend("force", base_opts, opts)

  fzf.fzf_exec(dir_list, opts_merged)
end

M.pick_project = function(search_dir, extra_entries)
  local dirs = vim.list_extend(
    get_sub_dirs(search_dir, { mindepth = 2, maxdepth = 2 }),
    extra_entries
  )
  vim.list.unique(dirs)
  table.sort(dirs)

  M.pick_dir(dirs, {
    prompt = "Projects> ",
    actions = {
      -- nested/sub dir picker
      ["ctrl-s"] = function(selected)
        M.pick_dir(get_sub_dirs(selected[1]))
      end,
    },
  })
end

return M
