return {
  'sainnhe/everforest',
  lazy = false,
  priority = 1000,
  config = function()
    -- Optionally configure and load the colorscheme
    -- directly inside the plugin declaration.
    vim.g.everforest_enable_italic = true
    vim.opt.background = "dark"
    vim.g.everforest_background = "hard"
    vim.g.everforest_colors_override = {
      bg0 = { "#1E2326", "234" },
    }
    vim.cmd.colorscheme('everforest')
  end
}

-- return {
--
--   'catppuccin/nvim',
--   lazy = false,    -- make sure we load this during startup if it is your main colorscheme
--   priority = 1000, -- make sure to load this before all the other start plugins
--   config = function()
--     require('catppuccin').setup({
--       -- ...
--     })
--
--     vim.cmd('colorscheme catppuccin-mocha')
--   end,
--
--
--   -- "navarasu/onedark.nvim",
--   -- config = function()
--   --   require("onedark").setup({
--   --     style = "darker",
--   --     colors = {
--   --       grey = "#878787",  -- define a new color
--   --       green = "#00ffaa", -- redefine an existing color
--   --     },
--   --     highlights = {
--   --       Visual = { bg = "#4a4a4a" },
--   --     },
--   --   })
--   --   require("onedark").load()
--   -- end
-- }
