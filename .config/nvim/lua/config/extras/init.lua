-- helper functions

local function get_extra_config_names(starts_with)
  local dir = vim.fn.stdpath("config") .. "/lua/config/extras"
  local result = {}

  for name, type in vim.fs.dir(dir) do
    if type == "file" and string.sub(name, -4) == ".lua" then
      local base = string.sub(name, 1, -5)

      if not starts_with
          or starts_with == ""
          or string.sub(base, 1, #starts_with) == starts_with
      then
        table.insert(result, base)
      end
    end
  end

  return result
end

-- usercmds

vim.api.nvim_create_user_command(
  "LoadExtra",
  function(opts)
    require("config.extras." .. opts.args)
  end,
  {
    desc = "Load plugins from config.extras",
    nargs = 1,
    complete = get_extra_config_names,
  }
)
