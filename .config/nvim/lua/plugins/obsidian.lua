return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  event = { "BufReadPre " .. vim.fn.expand("~/obsidian-vault/") },
  -- Replace the above line with `ft = "markdown"` if you want to load obsidian.nvim for all markdown files
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    workspaces = {
      {
        name = "default",
        path = "~/obsidian-vault",
      },
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
    picker = {
      name = "telescope.nvim",
      mappings = {
        -- Create a new note from your query.
        new = "<C-x>",
        -- Insert a link to the selected note.
        insert_link = "<C-l>",
      },
    },

    -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
    -- URL it will be ignored but you can customize this behavior here.
    ---@param url string
    follow_url_func = function(url)
      vim.fn.jobstart({ "xdg-open", url })
    end,
  },
}
