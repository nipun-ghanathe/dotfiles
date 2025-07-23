return {
  "jpalardy/vim-slime",
  keys = {
    {
      "<localleader>ti",
      "<cmd>silent !tmux split-window -h -d uv run ipython3<cr>",
      ft = "python",
      desc = "Tmux Split - IPython",
    },
    {
      "<localleader>thi",
      [[<cmd>silent !tmux split-window -v -l 40\% -d uv run ipython3<cr>]],
      ft = "python",
      desc = "Tmux Horizontal Split - IPython",
    },
  },
  init = function()
    vim.g.slime_target = "tmux"
    vim.g.slime_default_config = { socket_name = "default", target_pane = ":.2" }
    -- vim.g.slime_default_config = { socket_name = "default", target_pane = "{last}" }
    vim.g.slime_dont_ask_default = 1

    -- you can override this for different filetypes by setting
    -- vim.b.slime_cell_delimiter in the respective ftplugin
    vim.g.slime_cell_delimiter = [[^#\s*%%]]
    vim.g.slime_bracketed_paste = 1
    vim.g.slime_no_mappings = 1
  end,
  config = function()
    -- Setting up functions
    local function slime_send_raw(to_send)
      local orig = vim.g.slime_bracketed_paste
      vim.g.slime_bracketed_paste = 0
      vim.fn["slime#send"](to_send)
      vim.g.slime_bracketed_paste = orig
    end
    local function clear_then(action)
      slime_send_raw(vim.api.nvim_replace_termcodes("<C-l>", true, false, true))
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
      slime_send_raw(vim.api.nvim_replace_termcodes("<cr>", true, false, true))
      slime_send_raw(vim.api.nvim_replace_termcodes("<cr>", true, false, true))
    end
    local function send_ctrl(char)
      slime_send_raw(vim.api.nvim_replace_termcodes("<C-" .. char .. ">", true, false, true))
    end

    -- clear-then-send keymaps
    vim.keymap.set("n", "<leader>sn", function()
      clear_then(send_cell_and_next)
    end, { desc = "Slime: Clear => Send Cell and Next" })
    vim.keymap.set("n", "<leader>sb", function()
      clear_then(vim.fn["slime#send_cell"])
    end, { desc = "Slime: Clear => Send Cell/Block" })
    vim.keymap.set("n", "<leader>sr", function()
      clear_then(function()
        vim.fn["slime#send_lines"](vim.v.count1)
      end)
    end, { desc = "Slime: Clear => Send Region/Line" })
    vim.keymap.set(
      "v",
      "<leader>sr",
      [[:<c-u>call slime#send("clear\n") | call slime#send_op(visualmode(), 1)<cr>]],
      { desc = "Slime: Clear => Send Region" }
    )
    vim.keymap.set("n", "<leader>sf", function()
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
      slime_send_raw(vim.api.nvim_replace_termcodes("<CR>", true, false, true))
    end, { desc = "Slime: Send Return (<CR>)" })

    -- direct-send keymaps (without clearing)
    vim.keymap.set("n", "<leader>ssn", send_cell_and_next, { desc = "Slime: Send Cell and Next" })
    vim.keymap.set("n", "<leader>ssb", vim.fn["slime#send_cell"], { desc = "Slime: Send Cell/Block" })
    vim.keymap.set("n", "<leader>ssr", function()
      vim.fn["slime#send_lines"](vim.v.count1)
    end, { desc = "Slime: Send Region/Line" })
    vim.keymap.set("v", "<leader>ssr", ":<c-u>call slime#send_op(visualmode(), 1)<cr>", { desc = "Slime: Send Region" })
    vim.keymap.set("n", "<leader>ssf", send_file, { desc = "Slime: Send File" })
    -- vim.keymap.set("n", "<leader>ssm", "<Plug>SlimeMotionSend", { desc = "Slime: Send Motion" })
    -- vim.keymap.set("n", "<leader>ssp", "<Plug>SlimeParagraphSend", { desc = "Slime: Send Paragraph" })
    -- vim.keymap.set("n", "<c-c>v", "<Plug>SlimeConfig", { desc = "Slime: Config" })
  end,
}
