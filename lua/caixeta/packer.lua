-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'ray-x/go.nvim'
  use 'neovim/nvim-lspconfig'
  use 'windwp/nvim-ts-autotag'

  use "olimorris/onedarkpro.nvim"

  use 'folke/trouble.nvim'
  use {"akinsho/toggleterm.nvim", tag = '*'}

  use {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup {
        log_level = vim.log.levels.ERROR,
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
        auto_session_use_git_branch = false,

        auto_session_enable_last_session = false,

        -- ⚠️ This will only work if Telescope.nvim is installed
        session_lens = {
          theme_conf = { border = true },
          previewer = false,
        },
      }
    end
  }

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end
  }

  use {
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

  use "RRethy/vim-illuminate"

  use {
    "echasnovski/mini.indentscope",
    config = function ()
      require("mini.indentscope").setup {
        symbol = "│",
        options = { try_as_border = true },
      }
    end
  }

  -- use {
  --   "olexsmir/gopher.nvim",
  --   requires = {
  --     "leoluz/nvim-dap-go"
  --   },
  --   config = function()
  --     local gopher = require("gopher")
  --     gopher.setup({
  --       commands = {
  --         go = "go",
  --         gomodifytags = "gomodifytags",
  --         gotests = "gotests",
  --         impl = "impl",
  --         iferr = "iferr",
  --       },
  --       goimport = "gopls",
  --       gofmt = "gopls",
  --     })
  --   end,
  --   -- Optional: disable lazy loading
  --   -- and force the plugin to load immediately
  --   -- when Neovim starts up.
  --   -- However, keep in mind that this can slow down
  --   -- Neovim's startup time, especially if you have many plugins.
  --   -- Uncomment the following line to disable lazy loading.
  --   -- cmd = "packadd! gopher.nvim",
  -- }

  use 'kdheepak/lazygit.nvim'

  use 'styled-components/vim-styled-components'

  use {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}

  use 'editorconfig/editorconfig-vim'

  use 'tpope/vim-commentary'

  use 'tpope/vim-surround'

  use 'f-person/git-blame.nvim'

  use {
    'xiyaowong/transparent.nvim',
    config = function()
      require('transparent').setup({
        extra_groups = {
          "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
          "NvimTreeNormal", -- NvimTree
        },
      })
    end
  }

  use {
    "mcchrish/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    requires = "rktjmp/lush.nvim"
  }

  -- Tema
  -- use {'sainnhe/gruvbox-material', 
  --   config = function ()
  --     vim.cmd('colorscheme gruvbox-material')
  --     vim.g.gruvbox_material_background = "hard"
  --     vim.opt.background = 'dark'
  --   end
  -- }

  -- Discord Presence
  -- use 'andweeb/presence.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use {
    'nvim-tree/nvim-tree.lua',
    config = function ()
      require("nvim-tree").setup()
      vim.cmd('nnoremap <leader>e :NvimTreeToggle<CR>')
    end
  }

  use 'sheerun/vim-polyglot'

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
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function ()
      require('lualine').setup{
        options = {
          theme = 'auto',
        },
        sections = {lualine_c = {require('auto-session.lib').current_session_name}}
      }
    end
  }

  --  use "lukas-reineke/indent-blankline.nvim"
end)
