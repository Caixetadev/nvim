vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#181825", bg = "#181825" })
    vim.api.nvim_set_hl(0, "LspInfoBorder", { fg = "none", bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { fg = "none", bg = "none" })
  end,
})

-- local goimport_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*.go",
--   callback = function()
--     require("go.format").goimport()
--   end,
--   group = goimport_sync_grp,
-- })

local api = vim.api

-- don't auto comment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})
