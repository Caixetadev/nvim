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

local options = {
  incsearch = true, -- make search act like search in modern browsers
  backup = false, -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 1, -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  fileencoding = "utf-8", -- the encoding written to a file
  hlsearch = true, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns
  mouse = "a", -- allow the mouse to be used in neovim
  pumheight = 10, -- pop up menu height
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  showtabline = 0, -- always show tabs
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- creates a swapfile
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  updatetime = 100, -- faster completion (4000ms default)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab
  cursorline = true, -- highlight the current line
  number = true, -- set numbered lines
  breakindent = true, -- wrap lines with indent
  relativenumber = true, -- set relative numbered lines
  numberwidth = 4, -- set number column width to 2 {default 4}
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wrap = false, -- display lines as one long line
  scrolloff = 8, -- Makes sure there are always eight lines of context
  sidescrolloff = 8, -- Makes sure there are always eight lines of context
  showcmd = false, -- Don't show the command in the last line
  ruler = false, -- Don't show the ruler
  guifont = "monospace:h17", -- the font used in graphical neovim applications
  title = true, -- set the title of window to the value of the titlestring
  confirm = true, -- confirm to save changes before exiting modified buffer
  fillchars = { eob = " " }, -- change the character at the end of buffer
  -- cursorlineopt = "number",                -- set the cursorline
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
