vim.keymap.set("n", "]c", function()
  vim.fn.search([[^#\s*%%]], "W")
end, { buffer = 0, desc = "Jump to next Python cell" })

vim.keymap.set("n", "[c", function()
  vim.fn.search([[^#\s*%%]], "bW")
end, { buffer = 0, desc = "Jump to previous Python cell" })
