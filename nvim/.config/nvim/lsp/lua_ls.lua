return {
  -- cmd = { "lua-language-server" },
  cmd = { vim.env.HOME .. "/builds/lua-language-server/bin/lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" },
  settings = {
    Lua = {}
  }
}
