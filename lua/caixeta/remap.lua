vim.g.mapleader = " "

vim.keymap.set("n", "<A-j>", ":m .+1<cr>==")
vim.keymap.set("n", "<A-k>", ":m .-2<cr>==")

vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

vim.api.nvim_set_keymap("i", "jj", "<ESC>", { noremap = true })
-- vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true })
