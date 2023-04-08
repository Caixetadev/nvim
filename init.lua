require('plugins')

-- Define a tecla de espaço como líder
vim.g.mapleader = " "

-- Comando para rodar o PackerCompile automaticamente sempre que houver mudanças
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost */nvim/lua/plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup()

require('telescope.builtin')

-- Define keymap to open Git Files with leader+f
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua require("telescope.builtin").git_files()<CR>', { noremap = true, silent = true })

-- Ativa as linhas
vim.wo.number = true

-- Ativa as linhas relativas
vim.opt.relativenumber = true

-- Ativa o comando inccomand
vim.opt.inccommand = "split"

-- Mapeia a combinação <leader>q para :wq
vim.api.nvim_set_keymap('n', '<leader>q', ':wq<CR>', { noremap = true })

-- Mapeia a combinação <leader>sv para dar um reload na config
vim.api.nvim_set_keymap('n', '<leader>sv', ':source ~/.config/nvim/init.lua<CR>', { noremap = true })

-- Ativa o tema Gruvbox
vim.cmd('colorscheme gruvbox')

-- Definir a tecla de atalho com a leader e gg para abrir o Lazygit em fullscreen
vim.api.nvim_set_keymap('n', '<Leader>gg', ':LazyGit<CR>', { noremap = true, silent = true })

-- Mapeia o shift + l para avançar o buffer
vim.api.nvim_set_keymap('n', '<S-l>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })

-- Mapeia o shift + h para voltar o buffer
vim.api.nvim_set_keymap('n', '<S-h>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })

-- Mapear tecla de atalho do Leader + e para acionar o NvimTreeToggle
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Configurações para abrir o Lazygit em tela cheia
vim.g.lazygit_floating_window_scaling_factor = 1
vim.g.lazygit_floating_window_use_plenary = 1
vim.g.lazygit_floating_window_winblend = 0

vim.o.background = "dark" -- Define o modo de fundo do Neovim para escuro

-- Esse comando permite que o Vim e o Neovim usem a área de transferência do sistema operacional para copiar e colar texto.
vim.opt.clipboard:append("unnamedplus")

