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

require('go').setup()

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})

-- Ativa o tema Gruvbox
require('guihua.maps').setup({
  maps = {
    close_view = '<C-x>',
  }
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.format_on_save({
  format_opts = {
    timeout_ms = 10000,
  },
  servers = {
    ['null-ls'] = {'javascript', 'javascriptreact', 'typescriptreact', 'typescript', 'lua'},
  }
})

lsp.setup()

require("nvim-tree").setup()
vim.cmd('nnoremap <leader>e :NvimTreeToggle<CR>')

local null_ls = require('null-ls')

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.diagnostics.golangci_lint,
  }
})

vim.opt.mouse = nil

vim.o.ignorecase = true

vim.opt.hlsearch = false

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Ativar identação automática
-- vim.o.autoindent = true
-- Ativar identação automática inteligente
-- vim.o.smartindent = true

vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local builtin = require('telescope.builtin')

require('lualine').setup()

-- Define keymap para abrir o find files
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- Define keymap to open Git Files with leader+f
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- Define keymap para abrir o grep e procurar uma palavra
vim.keymap.set('n', '<leader>fg', builtin.live_grep)
vim.keymap.set('n', '<leader>fb', builtin.buffers)
vim.keymap.set('n', '<leader>fe', builtin.diagnostics)
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

vim.cmd('colorscheme gruvbox-material')
vim.g.gruvbox_material_background = "hard"
vim.opt.background = 'dark'

-- Esse comando permite que o Vim e o Neovim usem a área de transferência do sistema operacional para copiar e colar texto.
vim.opt.clipboard:append("unnamedplus")

-- Buffers

-- Abrir lista de buffer e escolher um
-- vim.api.nvim_set_keymap('n', '<leader>bl', ':buffers<CR>:buffer<Space>', { noremap = true, silent = true })

-- Abrir lista de buffer e escolher um
vim.api.nvim_set_keymap('n', '<leader>bd', ':bd<CR>', { noremap = true, silent = true })

-- Abrir o proximo buffer
vim.api.nvim_set_keymap('n', '<leader>bn', ':bn<CR>', { noremap = true, silent = true })

-- Abrir o buffer anterior
vim.api.nvim_set_keymap('n', '<leader>bp', ':bp<CR>', { noremap = true, silent = true })

-- Abrir um novo buffer na horizontal
vim.api.nvim_set_keymap('n', '<leader>bh', ':new<CR>', { noremap = true, silent = true })

-- Abrir um novo buffer na vertical
vim.api.nvim_set_keymap('n', '<leader>bv', ':vnew<CR>', { noremap = true, silent = true })

-- Splits

-- Faz o buffer abrir na direita
vim.o.splitright = true

-- move-se para a janela à esquerda
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })

-- move-se para a janela abaixo
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })

-- move-se para a janela acima
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })

-- move-se para a janela à direita
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })

-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

-- configure treesitter
treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
	},
	-- enable indentation
	indent = { enable = true },
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
	-- ensure these language parsers are installed
	ensure_installed = "all",
	-- auto install above language parsers
	auto_install = true,
	-- magic
	sync_install = false,
})

local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

-- Disable the statusline, tabline and cmdline while the alpha dashboard is open
autocmd('User', {
  pattern = 'AlphaReady',
  desc = 'disable status, tabline and cmdline for alpha',
  callback = function()
	  vim.go.laststatus = 0
          vim.opt.showtabline = 0
	  vim.opt.cmdheight = 0
  end,
  })
autocmd('BufUnload', {
  buffer = 0,
  desc = 'enable status, tabline and cmdline after alpha',
  callback = function()
          vim.go.laststatus = 2
	  vim.opt.cmdheight = 1
  end,
  })

require'cmp'.setup {
  sources = {
    { name = 'nvim_lsp', max_item_count = 11 },
  }
}

-- aumenta a altura do split atual em 5 linhas
vim.api.nvim_set_keymap('n', '<M-+>', ':resize +5<CR>', {noremap=true, silent=true})
-- diminui a altura do split atual em 5 linhas
vim.api.nvim_set_keymap('n', '<M-_>', ':resize -5<CR>', {noremap=true, silent=true})

vim.api.nvim_set_keymap('n', '+', ':vertical resize +5<CR>', {noremap=true, silent=true})

vim.api.nvim_set_keymap('n', '_', ':vertical resize -5<CR>', {noremap=true, silent=true})

vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true })
