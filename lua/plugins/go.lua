return {
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = { "go", "gomod" },

    opts = {
      go = "go",
      goimports = "gopls",
      fillstruct = "gopls",
      gofmt = "gofumpt",

      max_line_len = 120,

      icons = false,
      verbose = false,

      lsp_cfg = false,
      lsp_document_formatting = false,

      lsp_codelens = true,
      lsp_keymaps = false,

      diagnostic = {
        hdlr = false,
        underline = true,
        virtual_text = {
          space = 0,
          prefix = "",
        },
        signs = true,
      },
    },
  },
}
