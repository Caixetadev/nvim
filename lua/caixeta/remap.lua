vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.api.nvim_set_keymap("i", "jj", "<ESC>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true })
