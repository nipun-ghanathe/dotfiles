return {
  settings = {
    Lua = {
      format = {
        enable = true,
        defaultConfig = {
          indent_style = "space",
          indent_size = "2",
          quote_style = "double",

          trailing_table_separator = "smart",
          call_arg_parentheses = "always",

          max_line_length = "120",
          insert_final_newline = "true",
          space_before_inline_comment = "1",
          break_all_list_when_line_exceed = "true",

          align_call_args = "false",
          align_function_params = "false",
          align_continuous_assign_statement = "false",
          align_continuous_rect_table_field = "false",
          align_continuous_line_space = "false",
          align_if_branch = "false",
          align_array_table = "false",
          align_continuous_similar_call_args = "false",
          align_continuous_inline_comment = "false",
        },
      },
    },
  },
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
          path ~= vim.fn.stdpath("config")
          and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
      then
        return
      end
    end
    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
      runtime = {
        version = "LuaJIT",
        path = {
          "lua/?.lua",
          "lua/?/init.lua",
        },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
        },
      },
    })
  end,
}
