return {
  "catppuccin/nvim",
  name = "catppuccin",
  enabled = true,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
    })

    vim.cmd([[colorscheme catppuccin]])
  end,
}
