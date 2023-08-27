require('caixeta')

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "help", "alpha", "dashboard", "NvimTree", "Trouble", "lazy", "mason" },
  callback = function()
    vim.b.miniindentscope_disable = true
  end,
})

vim.cmd('colorscheme onedark')

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
