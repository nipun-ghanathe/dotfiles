-- Configure autocompletion
vim.o.autocomplete = true
vim.opt.completeopt = { "fuzzy", "menu", "menuone", "noselect", "popup" }
vim.opt.complete = { "o", ".", "w", "t" }

-- Enable LSP Completion (snippets expansion, text edits, exeucte associated commands etc)
-- TODO: If newer versions of nvim make this automatic, remove this block
-- check `:h lsp-completion` to know
vim.api.nvim_create_autocmd("LspAttach", {
  group = "lsp_user_autocmds",
  desc = "enable lsp completion (expand snippets, text edits, exectue associated commands etc)",
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client then
      vim.lsp.completion.enable(true, client.id, ev.buf)
    end
  end,
})

local augroup = vim.api.nvim_create_augroup("cmp_user_autocmds", { clear = true })

-- Change 'complete' to 'o' on LSP attach
vim.api.nvim_create_autocmd("LspAttach", {
  group = augroup,
  desc = "Change 'complete' to 'o' on LSP attach",
  callback = function(ev)
    vim.bo[ev.buf].complete = "o"
  end,
})

-- Disable autocompletion for certain filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  desc = "Disable autocompletion for certain filetypes",
  pattern = { "git" },
  callback = function(ev)
    vim.bo[ev.buf].autocomplete = false
  end,
})

-- TODO: remove this block after problem gets fixed
-- https://github.com/neovim/neovim/issues/37441
vim.api.nvim_create_autocmd("CompleteChanged", {
  group = augroup,
  desc = "change iskeyword",
  callback = function()
    vim.opt_local.iskeyword:append({ ".", ">", "+", "-", "{", "}" })
  end,
})
vim.api.nvim_create_autocmd("CompleteDone", {
  group = augroup,
  desc = "change iskeyword back to default",
  callback = function()
    vim.cmd("setlocal iskeyword&")
  end,
})
