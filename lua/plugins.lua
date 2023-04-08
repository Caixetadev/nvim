-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- LazyGit
  use 'kdheepak/lazygit.nvim'

  -- Nvim Tree
  use 'nvim-tree/nvim-tree.lua'

  -- Tema
  use 'gruvbox-community/gruvbox'

  -- Discord Presence
  use 'andweeb/presence.nvim'

  -- Buffer Line
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

  -- Telescope
  use {'nvim-telescope/telescope.nvim', tag = '0.1.1', requires = { {'nvim-lua/plenary.nvim'} }}

  -- Waka Time
  use 'wakatime/vim-wakatime'
end)
