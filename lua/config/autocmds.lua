local colors = {
  fg = "#76787d",
  bg = "#252829",
}

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    -- change the background color of floating windows and borders.
    vim.cmd("highlight NormalFloat guibg=none guifg=none")
    vim.cmd("highlight FloatBorder guifg=" .. colors.fg .. " guibg=none")
    vim.cmd("highlight NormalNC guibg=none guifg=none")

    -- change neotree background colors
    -- Default: NeoTreeNormal  xxx ctermfg=223 ctermbg=232 guifg=#d4be98 guibg=#141617
    vim.cmd("highlight NeoTreeNormal guibg=#1d2021")
    ---- vim.cmd('highlight NeoTreeFloatNormal guifg=#1d2021 guibg=#141617')
    vim.cmd("highlight NeoTreeFloatBorder guifg=#958272 guibg=#1d2021")
    vim.cmd("highlight NeoTreeEndOfBuffer guibg=#1d2021") -- 1d2021
  end,
})
