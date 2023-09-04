return {
  "folke/todo-comments.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  keys = {
    { "<leader>td", "<cmd>TodoTelescope<CR>", desc = "To-Do Toggle", },
  },
  config = function()
    require("todo-comments").setup {}
  end
}
