return {
  "Wansmer/treesj",
  keys = { { "Q", "<cmd>TSJToggle<CR>" } },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = true,
  opts = {
    use_default_keymaps = false,
    max_join_length = 200,
  },
}
