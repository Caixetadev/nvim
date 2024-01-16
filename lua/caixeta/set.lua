vim.opt.mouse = nil

vim.o.ignorecase = true

vim.opt.hlsearch = false

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2

vim.opt.termguicolors = true

vim.opt.relativenumber = true

vim.opt.inccommand = "split"

vim.opt.clipboard:append("unnamedplus")

vim.wo.number = true

vim.o.splitright = true

vim.opt.updatetime = 100 -- faster completion (4000ms default)
vim.opt.cursorline = true -- highlight the current line
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.fillchars = { eob = " " } -- change the character at the end of buffer
vim.opt.scrolloff = 8 -- Makes sure there are always eight lines of context
vim.opt.sidescrolloff = 8 -- Makes sure there are always eight lines of context
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.undofile = true

-- Buffers
vim.api.nvim_set_keymap("n", "<leader>bd", ":bd<CR>", { noremap = true, silent = true, desc = "Close buffer" })
vim.api.nvim_set_keymap("n", "<leader>bn", ":bn<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>bp", ":bp<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>bh", ":new<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>bv", ":vnew<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true })

vim.api.nvim_set_keymap("n", "<leader>q", ":wq<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>sv", ":source ~/.config/nvim/init.lua<CR>", { noremap = true })
vim.keymap.set("x", "<leader>p", function()
  return 'pgv"' .. vim.v.register .. "y"
end, { remap = false, expr = true })

vim.api.nvim_set_keymap("n", "<M-+>", ":resize +5<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-_>", ":resize -5<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "+", ":vertical resize +5<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "_", ":vertical resize -5<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true })

vim.filetype.add({
  extension = {
    tfvars = "terraform",
  },
})
