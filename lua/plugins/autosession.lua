return {
  'rmagatti/auto-session',
  -- keys = {{"<C-s>",
  --   function ()
  --     require("auto-session.session-lens").search_session()
  --   end
  -- }},
  config = function()
    require("auto-session").setup {
      log_level = vim.log.levels.ERROR,
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      auto_session_use_git_branch = false,

      auto_session_enable_last_session = false,

      -- -- ⚠️ This will only work if Telescope.nvim is installed
      session_lens = {
        theme_conf = { border = true },
        previewer = false,
      },
    }
  end
}
