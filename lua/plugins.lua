-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'ray-x/go.nvim'
  use 'neovim/nvim-lspconfig'
  use 'windwp/nvim-ts-autotag'

  use {"akinsho/toggleterm.nvim", tag = '*'}

  use {
    "olexsmir/gopher.nvim",
    requires = {
      "leoluz/nvim-dap-go"
    },
    config = function()
      local gopher = require("gopher")
      gopher.setup({
        commands = {
          go = "go",
          gomodifytags = "gomodifytags",
          gotests = "gotests",
          impl = "impl",
          iferr = "iferr",
        },
        goimport = "gopls",
        gofmt = "gopls",
      })
    end,
    -- Optional: disable lazy loading
    -- and force the plugin to load immediately
    -- when Neovim starts up.
    -- However, keep in mind that this can slow down
    -- Neovim's startup time, especially if you have many plugins.
    -- Uncomment the following line to disable lazy loading.
    -- cmd = "packadd! gopher.nvim",
  }


  use 'styled-components/vim-styled-components'

  use {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}

  use 'editorconfig/editorconfig-vim'

  -- LazyGit
  use 'kdheepak/lazygit.nvim'

  use 'tpope/vim-commentary'

  use 'tpope/vim-surround'

  use 'f-person/git-blame.nvim'

  -- Tema
  use 'sainnhe/gruvbox-material'

  -- Discord Presence
  use 'andweeb/presence.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use 'nvim-tree/nvim-tree.lua'

  use 'sheerun/vim-polyglot'

  use 'goolord/alpha-nvim'

  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  })

  use 'nvim-tree/nvim-web-devicons'

  -- Telescope
  use {'nvim-telescope/telescope.nvim', tag = '0.1.1', requires = { {'nvim-lua/plenary.nvim'} }}

  -- Waka Time
  use 'wakatime/vim-wakatime'

  -- Vim Be Good
  use 'ThePrimeagen/vim-be-good'

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Linter
  use 'dense-analysis/ale'

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  use {
	  "windwp/nvim-autopairs",
	  config = function() require("nvim-autopairs").setup {} end
  }

  use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

--  use "lukas-reineke/indent-blankline.nvim"
end)
