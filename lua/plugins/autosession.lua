return {
  "rmagatti/auto-session",
  -- enabled = false,
  lazy = false,
  keys = {
    -- Replaces require("auto-session.session-lens").search_session, which no longer exists
    { "<C-s>", "<cmd>AutoSession search<CR>", desc = "Session search" },
  },

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    log_level = "error",
    suppressed_dirs = { "~/Documents", "~/www" }, -- was: auto_session_suppress_dirs
    git_use_branch_name = false,                  -- was: auto_session_use_git_branch
    auto_restore_last_session = false,            -- was: auto_session_enable_last_session

    -- ⚠️ Session picker only shows up nicely if Telescope, snacks.nvim, or
    -- Fzf-Lua is installed; otherwise it falls back to vim.ui.select.
    session_lens = {
      picker_opts = {
        border = true, -- Telescope-specific; see README for Snacks/Fzf-Lua equivalents
      },
    },
  },
}
