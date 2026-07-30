return {
  'ray-x/guihua.lua',
  build = 'cd lua/fzy && make',
  lazy = true,
  init = function()
    local configured = false

    local function ensure_guihua()
      if configured then
        return
      end

      configured = true
      require('guihua').setup({})
    end

    vim.ui.select = function(...)
      ensure_guihua()
      return require('guihua.gui').select(...)
    end

    vim.ui.input = function(...)
      ensure_guihua()
      return require('guihua.gui').input(...)
    end
  end,
}
