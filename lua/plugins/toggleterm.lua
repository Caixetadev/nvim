return {
  "akinsho/toggleterm.nvim",
  keys = {
    { "<c-t>" },
  },
  config = function()
    require("toggleterm").setup({
      size = 60,
      open_mapping = [[<c-t>]],
      direction = "vertical",
      shade_terminals = false
    })

    function _G.set_terminal_keymaps()
      local opts = { noremap = true }
      vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
      vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
      vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
      vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
      vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
    end

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")
  end,
}
