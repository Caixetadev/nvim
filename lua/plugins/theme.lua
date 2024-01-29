return {
  "neanias/everforest-nvim",
  name = "everforest",
  enabled = true,
  priority = 1000,
  config = function()
    require("everforest").setup({
      background = "hard",
      -- ui_contrast = "high",
    })

    vim.cmd([[colorscheme everforest]])
  end,
}
