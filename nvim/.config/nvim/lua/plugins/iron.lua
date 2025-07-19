return {
  "Vigemus/iron.nvim",
  config = function()
    local iron = require("iron.core")
    local view = require("iron.view")
    local common = require("iron.fts.common")

    -- Clear output then run function
    local function clearThen(func)
      return function()
        iron.send(nil, { "%clear\f" })
        func()
      end
    end

    -- Keymaps
    vim.keymap.set(
      "n",
      "<leader>icm",
      clearThen(function()
        iron.run_motion("send_motion")
      end),
      { desc = "clear => send motion" }
    )
    vim.keymap.set(
      "n",
      "<leader>icv",
      clearThen(function()
        iron.send(nil, iron.mark_visual())
      end),
      { desc = "clear => send visual" }
    )
    vim.keymap.set("n", "<leader>icf", clearThen(iron.send_file), { desc = "clear => send file" })
    vim.keymap.set("n", "<leader>icl", clearThen(iron.send_line), { desc = "clear => send line" })
    vim.keymap.set("n", "<leader>icp", clearThen(iron.send_paragraph), { desc = "clear => send paragraph" })
    vim.keymap.set("n", "<leader>icb", clearThen(iron.send_code_block), { desc = "clear => send block" })
    vim.keymap.set(
      "n",
      "<leader>icn",
      clearThen(function()
        iron.send_code_block(true)
      end),
      { desc = "clear => send block and move to next block" }
    )

    -- Setup
    iron.setup({
      config = {
        -- Whether a repl should be discarded or not
        scratch_repl = true,
        -- Your repl definitions come here
        repl_definition = {
          sh = {
            -- Can be a table or a function that
            -- returns a table (see below)
            command = { "bash" },
          },
          python = {
            command = { "ipython3", "--no-autoindent" }, -- or { "python3" }
            -- format = common.bracketed_paste_python, -- send code line-by-line
            -- format = common.bracketed_paste, -- send code as a chunk
            format = function(lines, extras)
              local result = common.bracketed_paste_python(lines, extras)
              -- filter out commented lines
              local filtered = vim.tbl_filter(function(line)
                return not line:match("^%s*#")
              end, result)
              return filtered
            end,
            block_dividers = { "# %%", "#%%" },
          },
        },
        -- set the file type of the newly created repl to ft
        -- bufnr is the buffer id of the REPL and ft is the filetype of the
        -- language being used for the REPL.
        repl_filetype = function(bufnr, ft)
          return ft
          -- or return a string name such as the following
          -- return "iron"
        end,
        -- How the repl window will be displayed
        -- See below for more information
        -- repl_open_cmd = view.split.vertical.rightbelow("%50"),
        repl_open_cmd = {
          view.split.vertical.rightbelow("%45"),
          view.split.rightbelow("%40"),
        },
        -- repl_open_cmd can also be an array-style table so that multiple
        -- repl_open_commands can be given.
        -- When repl_open_cmd is given as a table, the first command given will
        -- be the command that `IronRepl` initially toggles.
        -- Moreover, when repl_open_cmd is a table, each key will automatically
        -- be available as a keymap (see `keymaps` below) with the names
        -- toggle_repl_with_cmd_1, ..., toggle_repl_with_cmd_k
        -- For example,
        --
        -- repl_open_cmd = {
        --   view.split.vertical.rightbelow("%40"), -- cmd_1: open a repl to the right
        --   view.split.rightbelow("%25")  -- cmd_2: open a repl below
        -- }
      },
      -- Iron doesn't set keymaps by default anymore.
      -- You can set them here or manually add keymaps to the functions in iron.core
      keymaps = {
        -- toggle_repl = "<leader>ir", -- toggles the repl open and closed.
        -- If repl_open_command is a table as above, then the following keymaps are
        -- available
        toggle_repl_with_cmd_1 = "<leader>ir",
        toggle_repl_with_cmd_2 = "<leader>irh",
        restart_repl = "<leader>iR", -- calls `IronRestart` to restart the repl
        send_motion = "<leader>ism",
        visual_send = "<leader>isv",
        send_file = "<leader>isf",
        send_line = "<leader>isl",
        send_paragraph = "<leader>isp",
        send_until_cursor = "<leader>isu",
        send_code_block = "<leader>isb",
        send_code_block_and_move = "<leader>isn",
        send_mark = "<leader>ism",
        mark_motion = "<leader>imc",
        mark_visual = "<leader>imc",
        remove_mark = "<leader>imd",
        cr = "<leader>is<cr>",
        interrupt = "<leader>isi",
        exit = "<leader>isq",
        clear = "<leader>icc",
      },
      -- If the highlight is on, you can change how it looks
      -- For the available options, check nvim_set_hl
      -- highlight = {
      --   italic = true,
      -- },
      highlight = {},
      ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
    })

    -- some other keymaps
    -- iron also has a list of commands, see :h iron-commands for all available commands
    vim.keymap.set("n", "<leader>rf", "<cmd>IronFocus<cr>")
    vim.keymap.set("n", "<leader>rh", "<cmd>IronHide<cr>")
  end,
}
