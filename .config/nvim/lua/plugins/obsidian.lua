return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  -- ft = "markdown",
  ---@diagnostic disable-next-line: undefined-field
  event = { "BufReadPre " .. vim.uv.os_homedir() .. "/obsidian-vault/**/*.md" },
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    workspaces = {
      {
        name = "default",
        ---@diagnostic disable-next-line: undefined-field
        path = vim.uv.os_homedir() .. "/obsidian-vault",
      },
    },

    ui = {
      enable = false,
    },

    new_notes_location = "current_dir",
    preferred_link_style = "markdown",
    disable_frontmatter = true,

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

    -- Optional, customize how note IDs are generated given an optional title.
    ---@param title string|?
    ---@return string
    note_id_func = function(title)
      local note_id = ""
      if title ~= nil then
        note_id = title:gsub(" ", "-"):lower()
      else
        for _ = 1, 4 do
          note_id = note_id .. string.char(math.random(65, 90))
        end
        note_id = tostring(os.time()) .. note_id
      end
      return note_id
    end,

    -- Optional, alternatively you can customize the frontmatter data.
    ---@return table
    note_frontmatter_func = function(note)
      -- Add the title of the note as an alias only if id and title are not same
      if note:has_alias(note.title) then
        for i, v in ipairs(note.aliases) do
          if v == note.title then
            table.remove(note.aliases, i)
          end
        end
      end
      if note.id ~= note.title then
        note:add_alias(note.title)
      end

      local out = { id = note.id, aliases = note.aliases, tags = note.tags }

      -- `note.metadata` contains any manually added fields in the frontmatter.
      -- So here we just make sure those fields are kept in the frontmatter.
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end

      return out
    end,
  },
}
