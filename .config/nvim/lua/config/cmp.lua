-- Configure autocompletion
vim.o.autocomplete = true
vim.opt.completeopt = { "fuzzy", "menu", "menuone", "noselect", "popup" }
vim.o.pumheight = 5
vim.o.pummaxwidth = 40

-- augroup for completion related autocmds
local augroup = vim.api.nvim_create_augroup("cmp_user_autocmds", { clear = true })

-- Disable autocompletion for certain filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  desc = "Disable autocompletion for certain filetypes",
  pattern = { "git" },
  callback = function(ev)
    vim.bo[ev.buf].autocomplete = false
  end,
})

-- Change 'complete' to 'o' on LSP attach
vim.api.nvim_create_autocmd("LspAttach", {
  group = augroup,
  desc = "Change 'complete' to 'o' on LSP attach",
  callback = function(ev)
    vim.bo[ev.buf].complete = "o"
  end,
})

-- Enable LSP Completion (snippets expansion, text edits, exeucte associated commands etc)
-- TODO: If newer versions of nvim make this automatic, remove this block
-- check `:h lsp-completion` to know

-- LSP clients whose completions items should be sorted before others
local priority_lsp_clients = { "emmet_language_server" }

vim.api.nvim_create_autocmd("LspAttach", {
  group = "lsp_user_autocmds",
  desc = "enable lsp completion (expand snippets, text edits, exectue associated commands etc)",
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client or not client:supports_method(vim.lsp.protocol.Methods.textDocument_completions) then
      return
    end
    vim.lsp.completion.enable(true, client.id, ev.buf, {
      cmp = function(a, b)
        local item_a = a.user_data.nvim.lsp.completion_item
        local item_b = b.user_data.nvim.lsp.completion_item

        local client_a = a.user_data.nvim.lsp.client_name
        local client_b = b.user_data.nvim.lsp.client_name

        local is_prio_a = vim.list_contains(priority_lsp_clients, client_a)
        local is_prio_b = vim.list_contains(priority_lsp_clients, client_b)
        if is_prio_a ~= is_prio_b then
          return is_prio_a
        end

        return (item_a.sortText or item_a.label) < (item_b.sortText or item_b.label)
      end,
    })
  end,
})
