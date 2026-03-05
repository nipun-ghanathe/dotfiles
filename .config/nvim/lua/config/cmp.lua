-- Configure autocompletion
vim.o.autocomplete = true
vim.o.autocompletedelay = 500
vim.opt.completeopt = { "fuzzy", "menu", "menuone", "noinsert", "popup" }
vim.o.pumheight = 8

-- Disable Enter from accepting selected completion entry
-- vim.keymap.set("i", "<cr>", function()
--   return vim.fn.pumvisible() ~= 0 and "<c-e><cr>" or "<cr>"
-- end, { expr = true })
vim.keymap.set("i", "<cr>", function()
  if vim.fn.pumvisible() ~= 0 then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<c-e>", true, false, true), "n", false)
  end
  vim.api.nvim_feedkeys(require("nvim-autopairs").autopairs_cr(), "n", true)
end, { expr = true })

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

-- TODO: Sort completions from emmet_language_server over everything else.
--       Maybe the opts.cmp field of vim.lsp.completion.enable() will help.
