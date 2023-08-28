-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

return require('lazy').setup({
  'ray-x/go.nvim',
  'neovim/nvim-lspconfig',
  'windwp/nvim-ts-autotag',

  "olimorris/onedarkpro.nvim",

  'folke/trouble.nvim',
  "akinsho/toggleterm.nvim",

  {
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
  },

  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    config = function ()
      require("indent_blankline").setup {
        char = "│",
        show_trailing_blankline_indent = false,
        show_current_context = false,
        filetype_exclude = {"NvimTree"}
      }
    end
  },

  "RRethy/vim-illuminate",

  {
    "echasnovski/mini.indentscope",
    config = function ()
      require("mini.indentscope").setup {
        symbol = "│",
        options = { try_as_border = true },
      }
    end
  },

  {
    "olexsmir/gopher.nvim",
    dependencies = {
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
  },

  'kdheepak/lazygit.nvim',

  'styled-components/vim-styled-components',

  {'ray-x/guihua.lua', build = 'cd lua/fzy && make'},

  'editorconfig/editorconfig-vim',

  'tpope/vim-commentary',

  'tpope/vim-surround',

  'f-person/git-blame.nvim',

  {
    'xiyaowong/transparent.nvim',
    config = function()
      require('transparent').setup({
        extra_groups = {
          "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
          "NvimTreeNormal", -- NvimTree
        },
      })
    end
  },

  {
    "mcchrish/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = "rktjmp/lush.nvim"
  },

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

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },

  {
    'nvim-tree/nvim-tree.lua',
    config = function ()
      require("nvim-tree").setup()
      vim.cmd('nnoremap <leader>e :NvimTreeToggle<CR>')
    end
  },

  'ThePrimeagen/harpoon',

  ({
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  }),

  'nvim-tree/nvim-web-devicons',

  -- Telescope
  {'nvim-telescope/telescope.nvim', version = '0.1.1', dependencies = { {'nvim-lua/plenary.nvim'} }},

  -- Waka Time
  'wakatime/vim-wakatime',

  -- Vim Be Good
  'ThePrimeagen/vim-be-good',

  -- Git
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
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
  },

  {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
    config = function ()
      require('lualine').setup{
        options = {
          theme = 'auto',
        },
        sections = {lualine_c = {require('auto-session.lib').current_session_name}}
      }
    end
  },

  --  use "lukas-reineke/indent-blankline.nvim"
})
