local colors = {
  fg = "#fffff",
  bg = "#fffff",
}

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    -- change the background color of floating windows and borders.
    vim.cmd("highlight NormalFloat guibg=none guifg=none")
    vim.cmd("highlight FloatBorder guifg=" .. colors.fg .. " guibg=none")
    vim.cmd("highlight NormalNC guibg=none guifg=none")

    -- change neotree background colors
    -- Default: NeoTreeNormal  xxx ctermfg=223 ctermbg=232 guifg=#d4be98 guibg=#141617
    vim.cmd("highlight NeoTreeNormal guibg=NONE")
    vim.cmd("highlight NeoTreeFloatNormal guifg=NONE guibg=NONE")
    vim.cmd("highlight NeoTreeFloatBorder guifg=NONE guibg=NONE")
    vim.cmd("highlight NeoTreeEndOfBuffer guibg=NONE") -- 1d2021
  end,
})
