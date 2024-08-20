-- return {
--   "sainnhe/everforest",
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme("everforest")
--
--     vim.g.everforest_enable_italic = 1
--     -- vim.g.everforest_better_performance = 1
--     vim.g.everforest_background = "hard"
--   end,
-- }

return {

  'catppuccin/nvim',
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('catppuccin').setup({
      -- ...
    })

    vim.cmd('colorscheme catppuccin-mocha')
  end,


  -- "navarasu/onedark.nvim",
  -- config = function()
  --   require("onedark").setup({
  --     style = "darker",
  --     colors = {
  --       grey = "#878787",  -- define a new color
  --       green = "#00ffaa", -- redefine an existing color
  --     },
  --     highlights = {
  --       Visual = { bg = "#4a4a4a" },
  --     },
  --   })
  --   require("onedark").load()
  -- end
}
