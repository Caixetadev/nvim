return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      log_level = vim.log.levels.ERROR,
      auto_session_suppress_dirs = { "~/Documents", "~/www" },
      auto_session_use_git_branch = false,

      auto_session_enable_last_session = false,

      -- -- ⚠️ This will only work if Telescope.nvim is installed
      session_lens = {
        theme_conf = { border = true },
        previewer = false,
      },
    })

    vim.keymap.set("n", "<C-s>", require("auto-session.session-lens").search_session, {
      noremap = true,
    })
  end,
}
