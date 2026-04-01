-- Configure autocompletion
vim.o.autocomplete = true
vim.o.autocompletedelay = 1000
vim.opt.completeopt = { 'fuzzy', 'menu', 'menuone', 'noselect', 'popup' }
vim.o.pumheight = 5
vim.o.pummaxwidth = 40

-- augroup for completion related autocmds
local aug = vim.api.nvim_create_augroup('my.cmp', { clear = true })

-- Remove 'fuzzy' from 'cot' for certain filetypes
vim.api.nvim_create_autocmd('FileType', {
  group = aug,
  desc = "Remove 'fuzzy' from 'cot' for certain filetypes",
  pattern = { 'html', 'css' },
  callback = function()
    vim.opt_local.completeopt:remove({ 'fuzzy' })
  end,
})

-- Change 'complete' to 'o' on LSP attach
vim.api.nvim_create_autocmd('LspAttach', {
  group = aug,
  desc = "Change 'complete' to 'o' on LSP attach",
  callback = function(ev)
    vim.bo[ev.buf].complete = 'o'
  end,
})

-- Enable LSP Completion (snippets expansion, text edits, execute associated commands etc)
-- TODO: If newer versions of nvim make this automatic, remove this block
-- check `:h lsp-completion` to know
vim.api.nvim_create_autocmd('LspAttach', {
  group = 'my.lsp',
  desc = 'enable lsp completion (expand snippets, text edits, exectue associated commands etc)',
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client or not client:supports_method(vim.lsp.protocol.Methods.textDocument_completions) then
      return
    end
    vim.lsp.completion.enable(true, client.id, ev.buf)
  end,
})
