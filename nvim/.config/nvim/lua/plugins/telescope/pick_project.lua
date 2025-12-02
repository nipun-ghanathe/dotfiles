local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local Job = require("plenary.job")

-- Previewer using `eza`
local dir_previewer = previewers.new_termopen_previewer({
  get_command = function(entry)
    return { "eza", "--icons", "--group-directories-first", "--oneline", entry.value }
  end,
})

-- Utility job to run fd and return results
local function run_fd(cmd)
  local results = {}

  Job:new({
    command = "/usr/bin/fdfind",
    args = cmd,
    on_stdout = function(_, line)
      table.insert(results, line)
    end,
  }):sync()

  return results
end

-- Main picker
local function directory_picker(cd_cmd, opts)
  cd_cmd = cd_cmd or "cd" -- you can use `tcd` and `lcd`
  opts = opts or {}

  local dirs = run_fd({ ".", vim.fn.expand("~/code"), "--type", "d", "--max-depth", "2" })

  pickers
    .new(opts, {
      prompt_title = "Pick Project",
      finder = finders.new_table({
        results = dirs,
      }),
      sorter = conf.generic_sorter(opts),
      previewer = dir_previewer,

      attach_mappings = function(prompt_bufnr, map)
        -- <cr> => :cd into directory and open oil in selected director,y
        actions.select_default:replace(function()
          local entry = action_state.get_selected_entry()
          actions.close(prompt_bufnr)

          local dir = entry.value
          vim.cmd(cd_cmd .. " " .. dir)

          require("oil").open(entry.value)
        end)

        -- <c-cr> => open new nested directory picker
        map("i", "<c-cr>", function()
          local entry = action_state.get_selected_entry()
          actions.close(prompt_bufnr)

          directory_picker({ base = entry.value })
        end)

        -- <c-f> => :cd into directory and open find_files picker
        map("i", "<c-f>", function()
          local entry = action_state.get_selected_entry()
          actions.close(prompt_bufnr)

          local dir = entry.value
          vim.cmd(cd_cmd .. " " .. dir)

          require("telescope.builtin").find_files({ cwd = dir })
        end)

        return true
      end,
    })
    :find()
end

return {
  directory_picker = directory_picker,
}
