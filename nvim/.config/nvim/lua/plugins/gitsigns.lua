return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup({
        on_attach = function(bufnr)
          -- Don't attach to netrw buffers
          local ft = vim.api.nvim_buf_get_option(bufnr, 'filetype')
          if ft == 'netrw' then
            return false
          end

          return true
        end,
      })
    end,
  },
}
