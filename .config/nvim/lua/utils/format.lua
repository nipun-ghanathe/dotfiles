local M = {}

M.formatter_cmds = {
  prettier = function(fname)
    return {
      'prettier',
      '--config-precedence=prefer-file',
      '--no-semi',
      '--single-quote',
      '--stdin-filepath',
      fname,
    }
  end,
}

M.default_config = {
  formatters_by_ft = {},
  organize_imports_filetypes = {},
}

local function compute_config()
  return vim.tbl_deep_extend('force', {}, M.default_config, vim.g.format_config or {})
end

M.config = compute_config()

function M.reload_config()
  M.config = compute_config()
end

function M.get_formatter_cmd(bufnr)
  bufnr = bufnr or 0

  local ft = vim.bo[bufnr].filetype
  local fname = vim.api.nvim_buf_get_name(bufnr)

  local key = M.config.formatters_by_ft[ft]
  local formatter = key and M.formatter_cmds[key]

  if type(formatter) == 'function' then
    return formatter(fname)
  end

  return formatter
end

function M.run_formatter(cmd, bufnr)
  if vim.fn.executable(cmd[1]) == 0 then
    return false, 'Formatter not found: ' .. cmd[1]
  end

  local obj = vim.system(cmd, {
    stdin = vim.api.nvim_buf_get_lines(bufnr, 0, -1, true),
    text = true,
  }):wait(2000)

  if not (obj and obj.code == 0) then
    return false, obj and obj.stderr or 'Formatter failed or timed out'
  end

  local view = vim.fn.winsaveview()
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, true, vim.split(obj.stdout, '\n', { trimempty = true }))
  vim.fn.winrestview(view)

  return true
end

function M.organize_imports()
  vim.lsp.buf.code_action({
    ---@diagnostic disable-next-line: missing-fields
    context = { only = { 'source.organizeImports' } },
    apply = true,
  })
end

function M.format_file(bufnr)
  bufnr = bufnr or 0
  local ft = vim.bo[bufnr].filetype

  local cmd = M.get_formatter_cmd(bufnr)
  if cmd then
    local ok, err = M.run_formatter(cmd, bufnr)
    if not ok then
      vim.notify(err or 'Formatter failed', vim.log.levels.ERROR)
      return
    end
  elseif #vim.lsp.get_clients({ bufnr = bufnr }) > 0 then
    vim.lsp.buf.format()
  end

  if vim.list_contains(M.config.organize_imports_filetypes, ft) then
    M.organize_imports()
  end
end

-- set up usercmds and autocmds for autoformat
-- formatonsave can be enabled by default by setting vim.g.formatonsave = true
function M.init()
  if M._initialized then return end
  M._initialized = true

  vim.api.nvim_create_user_command('FormatOnSaveToggle', function(opts)
    local var = opts.bang and vim.b or vim.g
    var.formatonsave = var.formatonsave ~= true
    vim.notify(
      string.format(
        'format on save -> global: %s | buffer: %s',
        vim.g.formatonsave,
        vim.b.formatonsave == nil and 'inherit' or vim.b.formatonsave
      ),
      vim.log.levels.INFO
    )
  end, { bang = true })

  local augroup = vim.api.nvim_create_augroup('FormatConfig', { clear = true })

  vim.api.nvim_create_autocmd('BufWritePre', {
    group = augroup,
    desc = 'Format before save',
    callback = function(ev)
      if vim.b.formatonsave == true or (vim.b.formatonsave == nil and vim.g.formatonsave) then
        M.format_file(ev.buf)
      end
    end,
  })
end

-- If you make this a plugin then instead of doing M.init(),
-- move to M.init to `plugin/`
M.init()

return M
