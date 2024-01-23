return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      sh = { "beautysh" },
      bash = { "beautysh" },
      rust = { "rustfmt" },
      c = { "clang_format" },
      cpp = { "clang_format" },
      java = { "clang_format" },
      lua = { "stylua" },
      go = { "goimports", "gofumpt" },
      html = { "prettierd" },
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      javascriptreact = { "prettierd" },
      typescriptreact = { "prettierd" },
      markdown = { "prettierd" },
      xml = { "xmlformat" },
      json = { "prettierd" },
      python = { "black" },
      yaml = { "prettierd" },
    },
    format_on_save = {
      timeout_ms = 100,
      lsp_fallback = true,
    },
  },
}
