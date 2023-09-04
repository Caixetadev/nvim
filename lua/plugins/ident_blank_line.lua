return {
  "lukas-reineke/indent-blankline.nvim",
  config = function ()
    require("indent_blankline").setup {
      char = "│",
      show_trailing_blankline_indent = false,
      show_current_context = false,
      filetype_exclude = {"NvimTree"}
    }
  end
}
