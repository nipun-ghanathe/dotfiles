return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local gs = require("gitsigns")
    gs.setup()

    vim.keymap.set("n", "]h", function()
      gs.nav_hunk("next")
    end, { desc = "Gitsigns: Next Hunk" })
    vim.keymap.set("n", "[h", function()
      gs.nav_hunk("prev")
    end, { desc = "Gitsigns: Prev Hunk" })

    -- Other useful gitsigns-functions
    -- show
    -- diffthis (use fugitive instead - :Gdiff)
    -- stage_buffer
    -- reset_buffer_index
    -- select_hunk
    -- stage_hunk
    -- reset_hunk
    -- preview_hunk_inline
  end,
}
