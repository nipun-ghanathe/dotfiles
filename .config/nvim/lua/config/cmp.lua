-- Configure autocompletion
vim.o.autocomplete = true
vim.opt.completeopt = { "fuzzy", "menu", "menuone", "noinsert", "popup" }
vim.opt.complete = { "o", ".", "w", "t" }

-- Prevent <CR> from accepting completion
-- TODO: Find a better way to do this
-- vim.keymap.set("i", "<cr>", function()
--   return vim.fn.pumvisible() ~= 0 and "<c-e><cr>" or "<cr>"
-- end, { desc = "Insert newline; cancel completion menu if visible", expr = true })
vim.keymap.set("i", "<cr>", function()
  if vim.fn.pumvisible() ~= 0 then
    vim.api.nvim_feedkeys(
      vim.api.nvim_replace_termcodes("<c-e><cr>", true, false, true),
      "n",
      true
    )
  else
    local keys = require("nvim-autopairs").autopairs_cr()
    vim.api.nvim_feedkeys(keys, "n", true)
  end
end, { desc = "Insert newline; cancel completion menu if visible" })

-- Enable LSP Completion (snippets expansion, text edits, exeucte associated commands etc)
-- TODO: If newer versions of nvim make this automatic, remove this block
-- check `:h lsp-completion` to know
vim.api.nvim_create_autocmd("LspAttach", {
  group = "lsp_user_autocmds",
  desc = "enable lsp completion (expand snippets, text edits, exectue associated commands etc)",
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      -- vim.lsp.completion.enable(true, client.id, ev.buf)
    end
  end,
})

-- TODO: remove this block after problem gets fixed
-- https://github.com/neovim/neovim/issues/37441
local augroup = vim.api.nvim_create_augroup("cmp_user_autocmds", { clear = true })
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
