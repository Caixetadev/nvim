return {
  'nvim-telescope/telescope.nvim',
  version = '0.1.4',
  dependencies = { { 'nvim-lua/plenary.nvim' } },
  keys = {
    { "<leader>ff", "<cmd>Telescope git_files<CR>",  desc = "Find files" },
    { "<C-p>",      "<cmd>Telescope find_files<CR>", desc = "List buffers" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>",  desc = "Fast string grep" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>",    desc = "Recent files" },
    { "<leader>fe", "<cmd>Telescope diagnostics",    desc = "LSP incoming calls" },
    { "<leader>fr", "<cmd>Telescope resume<CR>",     desc = "Telescope resume" },
    {
      "<leader>tg",
      function()
        require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
      end,
      desc = "Grep through files"
    },
  },
}
