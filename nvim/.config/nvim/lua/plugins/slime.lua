return {
  "jpalardy/vim-slime",
  lazy = true,
  init = function()
    -- these two should be set before the plugin loads
    vim.g.slime_target = "neovim"
    vim.g.slime_no_mappings = true
  end,
  config = function()
    -- options
    vim.g.slime_bracketed_paste = true

    -- options specific for target = neovim
    vim.g.slime_input_pid = false
    vim.g.slime_suggest_default = true
    vim.g.slime_menu_config = false
    vim.g.slime_neovim_ignore_unlisted = false

    -- slime cell delimiter
    vim.g.slime_cell_delimiter = [[^#\s*%%]]
    local ft_cell_delimiters = {
      python = [[^#\s*%%]],
    }
    vim.api.nvim_create_autocmd("FileType", {
      desc = "Set slime cell delimiter",
      pattern = "*",
      callback = function()
        local ft = vim.bo.filetype
        if ft_cell_delimiters[ft] then
          vim.b.slime_cell_delimiter = ft_cell_delimiters[ft]
        end
      end,
    })

    -- Setting up functions
    local function slime_send_raw(to_send)
      local orig = vim.g.slime_bracketed_paste
      vim.g.slime_bracketed_paste = false
      vim.fn["slime#send"](to_send)
      vim.g.slime_bracketed_paste = orig
    end
    local function send_ctrl(char)
      slime_send_raw(vim.api.nvim_replace_termcodes("<C-" .. char .. ">", true, false, true))
    end
    local function send_cr()
      -- slime_send_raw(vim.api.nvim_replace_termcodes("<CR>", true, false, true)) -- sends \r
      slime_send_raw("\n")
    end
    local function clear_then(action)
      send_ctrl("l")
      action()
    end
    local function send_cell_and_next()
      vim.fn["slime#send_cell"]()
      local cell_delimiter = vim.fn["slime#config#resolve"]("cell_delimiter") or "# %%"
      vim.fn.search(cell_delimiter, "W")
    end
    local function send_file()
      vim.cmd.write()
      local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
      local text = table.concat(lines, "\n")
      vim.fn["slime#send"](text)
      send_cr()
    end

    -- clear-then-send keymaps
    vim.keymap.set("n", "<c-cr>", function()
      clear_then(send_cell_and_next)
    end, { desc = "Slime: Clear => Send Cell and Next" })
    vim.keymap.set("n", "<s-cr>", function()
      clear_then(vim.fn["slime#send_cell"])
    end, { desc = "Slime: Clear => Send Cell/Block" })
    vim.keymap.set("n", "<leader>sl", function()
      clear_then(function()
        vim.fn["slime#send_lines"](vim.v.count1)
      end)
    end, { desc = "Slime: Clear => Send Line" })
    vim.keymap.set(
      "v",
      "<c-cr>",
      [[:<c-u>call slime#send("clear\n") | call slime#send_op(visualmode(), 1)<cr>]],
      { desc = "Slime: Clear => Send Region" }
    )
    vim.keymap.set("n", "<c-m-cr>", function()
      clear_then(send_file)
    end, { desc = "Slime: Clear => Send File" })

    -- Send 'clear', 'exit', and 'interrupt' and '<cr>'
    vim.keymap.set("n", "<leader>scl", function()
      send_ctrl("l")
    end, { desc = "Slime: Send Clear (C-l)" })
    vim.keymap.set("n", "<leader>scd", function()
      send_ctrl("d")
    end, { desc = "Slime: Send Exit (C-d)" })
    vim.keymap.set("n", "<leader>scc", function()
      send_ctrl("c")
    end, { desc = "Slime: Send Interrupt (C-c)" })
    vim.keymap.set("n", "<leader>scr", function()
      send_cr()
    end, { desc = "Slime: Send Return (<CR>)" })

    -- direct-send keymaps (without clearing)
    vim.keymap.set("n", "<leader>sn", send_cell_and_next, { desc = "Slime: Send Cell and Next" })
    vim.keymap.set("n", "<leader>sb", vim.fn["slime#send_cell"], { desc = "Slime: Send Cell/Block" })
    vim.keymap.set("n", "<c-space>", function()
      vim.fn["slime#send_lines"](vim.v.count1)
    end, { desc = "Slime: Send Region/Line" })
    vim.keymap.set("v", "<leader>sr", ":<c-u>call slime#send_op(visualmode(), 1)<cr>", { desc = "Slime: Send Region" })
    vim.keymap.set("n", "<leader>sf", send_file, { desc = "Slime: Send File" })
    -- vim.keymap.set("n", "<leader>ssm", "<Plug>SlimeMotionSend", { desc = "Slime: Send Motion" })
    -- vim.keymap.set("n", "<leader>ssp", "<Plug>SlimeParagraphSend", { desc = "Slime: Send Paragraph" })
    -- vim.keymap.set("n", "<c-c>v", "<Plug>SlimeConfig", { desc = "Slime: Config" })
  end,
}
