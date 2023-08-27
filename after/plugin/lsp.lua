local lsp = require('lsp-zero')
lsp.preset('recommended')

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

lsp.ensure_installed({
  'tsserver',
  'bashls',
  'cssls',
  'dockerls',
  'emmet_ls',
  'golangci_lint_ls',
  'gopls',
  'grammarly',
  'html',
  'jsonls',
  'lua_ls',
  'prismals',
  'tailwindcss',
  'taplo',
  'yamlls'
})

local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})

require('guihua.maps').setup({
  maps = {
    close_view = '<C-x>',
  }
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.format_on_save({
  format_opts = {
    timeout_ms = 10000,
  },
  servers = {
    ['null-ls'] = {'javascript', 'javascriptreact', 'typescriptreact', 'typescript', 'lua'},
  }
})

lsp.setup()
