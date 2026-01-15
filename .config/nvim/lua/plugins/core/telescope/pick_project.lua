local MAIN_SEARCH_DIR = vim.fs.abspath("~/code")
local EXTRA_ENTRIES = {
  vim.fs.abspath("~/dotfiles/.config/nvim"),
}

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local Job = require("plenary.job")

-- Dir Previewer
local dir_previewer = previewers.new_termopen_previewer({
  get_command = function(entry)
    return { "ls", "--color=yes", "--group-directories-first", "--format=single-column", entry.value }
  end,
})

-- Utility job to run fd and return results
local function run_fd(cmd)
  local results = {}

  Job:new({
    command = "/usr/bin/fd",
    args = cmd,
    on_stdout = function(_, line)
      table.insert(results, line)
    end,
  }):sync()

  return results
end

-- Main picker
local function directory_picker(cd_cmd, search_dir, opts)
  cd_cmd = cd_cmd or "cd" -- you can use `tcd` and `lcd`
  opts = opts or {}

  local dirs
  if search_dir then
    dirs = run_fd({ ".", vim.fs.abspath(search_dir), "--type", "d" })
  else
    local fd_dirs = run_fd({ ".", MAIN_SEARCH_DIR, "--type", "d", "--max-depth", "2", "--min-depth", "2" })
    dirs = vim.iter({ fd_dirs, EXTRA_ENTRIES }):flatten():totable()
  end

  pickers
    .new(opts, {
      prompt_title = "Pick Project",
      finder = finders.new_table({
        results = dirs,
        entry_maker = function(entry)
          return {
            display = string.gsub(entry, (search_dir or vim.uv.os_homedir()) .. "/", ""),
            ordinal = entry,
            value = entry,
          }
        end,
      }),
      sorter = conf.generic_sorter(opts),
      previewer = dir_previewer,

      attach_mappings = function(prompt_bufnr, map)
        -- <cr> => :cd into directory and open find_files picker
        actions.select_default:replace(function()
          local entry = action_state.get_selected_entry()
          actions.close(prompt_bufnr)

          local dir = entry.value
          vim.cmd(cd_cmd .. " " .. dir)

          require("telescope.builtin").find_files({ cwd = dir })
        end)

        -- <c-e> => :cd into directory and explore
        map("i", "<c-e>", function()
          local entry = action_state.get_selected_entry()
          actions.close(prompt_bufnr)

          local dir = entry.value
          vim.cmd(cd_cmd .. " " .. dir)

          vim.cmd("e .")
        end)

        -- <c-cr> => open new nested directory picker
        map("i", "<c-cr>", function()
          local entry = action_state.get_selected_entry()
          actions.close(prompt_bufnr)

          directory_picker(nil, entry.value)
        end)

        return true
      end,
    })
    :find()
end

return {
  directory_picker = directory_picker,
}
