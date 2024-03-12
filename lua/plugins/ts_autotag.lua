return {
  "windwp/nvim-ts-autotag",
  enabled = true,
  config = function()
    require("nvim-treesitter.configs").setup({
      autotag = {
        enable_close_on_slash = false,
      },
    })
  end,
}
