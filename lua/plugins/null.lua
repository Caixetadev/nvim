return  {
  "jose-elias-alvarez/null-ls.nvim",
  ft = { "go", "typescript", "typescriptreact", "javascript", "javascriptreact" },
  dependencies = { "nvim-lua/plenary.nvim" },
  enabled = false,
  config = function ()
    local null_ls = require('null-ls')

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.diagnostics.golangci_lint,
      }
    })
  end
}
