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

local lsp = require('lsp-zero')

lsp.preset('recommended')

-- Fix Undefined global 'vim'
lsp.configure('lua-language-server', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.setup()

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local builtin = require('telescope.builtin')

require('lualine').setup()

-- Define keymap para abrir o find files
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- Define keymap to open Git Files with leader+f
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- Define keymap para abrir o grep e procurar uma palavra
vim.keymap.set('n', '<leader>ps', function ()
	builtin.grep_string({  search = vim.fn.input('Grep > ')});
end)

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

vim.o.background = "dark" -- Define o modo de fundo do Neovim para escuro

-- Esse comando permite que o Vim e o Neovim usem a área de transferência do sistema operacional para copiar e colar texto.
vim.opt.clipboard:append("unnamedplus")

