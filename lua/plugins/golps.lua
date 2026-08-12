return {
  "neovim/nvim-lspconfig",

  opts = {
    servers = {
      gopls = {
        settings = {
          gopls = {
            gofumpt = true,

            -- Auto-completa símbolos que precisam de import
            completeUnimported = true,

            -- Usa placeholders no autocomplete
            usePlaceholders = true,

            analyses = {
              unusedparams = true,
              shadow = true,
            },

            staticcheck = true,
          },
        },
      },
    },
  },
}
