require("toggleterm").setup{
  size = 80,
  direction = 'vertical' ,
  open_mapping = [[\]],
}

function _G.set_terminal_keymaps()
  local opts = {noremap = true, silent = true}

  -- Define os mesmos atalhos da configuração anterior
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

-- Define os atalhos quando um terminal é aberto
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
