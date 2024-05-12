return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufEnter" },
  main = "ibl",
  opts = {
    indent = {
      -- char = { "┊" },
      -- char = "▏",
      char = "│",
    },
    scope = {
      show_start = false,
      show_end = false,
      -- highlight = { "IndentBlanklineContextChar" },
    },
    exclude = {
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "lazy",
      },
    },
    -- show_trailing_blankline_indent = false,
    -- show_current_context = false,
  },
}
