return {
  "ThePrimeagen/harpoon",
  keys = {
    { "<a-8>" },
    { "<a-7>" },
    { "<a-6>" },
    { "<a-5>" },
    { "<a-4>" },
    { "<a-3>" },
    { "<a-2>" },
    { "<a-1>" },
  },
  config = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    vim.keymap.set("n", "<a-8>", mark.add_file)
    vim.keymap.set("n", "<a-7>", ui.toggle_quick_menu)

    vim.keymap.set("n", "<a-1>", function()
      ui.nav_file(1)
    end)
    vim.keymap.set("n", "<a-2>", function()
      ui.nav_file(2)
    end)
    vim.keymap.set("n", "<a-3>", function()
      ui.nav_file(3)
    end)
    vim.keymap.set("n", "<a-4>", function()
      ui.nav_file(4)
    end)

    vim.keymap.set("n", "<a-5>", function()
      ui.nav_next()
    end)
    vim.keymap.set("n", "<a-6>", function()
      ui.nav_prev()
    end)
  end,
}
