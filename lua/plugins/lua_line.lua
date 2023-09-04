return {
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
}
