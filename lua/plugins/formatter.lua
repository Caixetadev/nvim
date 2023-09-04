return {
  {
    "mhartington/formatter.nvim",
    cmd = "Format",
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact", "html", "lua" },
    keys = {
      { "<leader>F", "<cmd>Format<CR>", desc = "Formatter" },
    },
    config = function()
      require("formatter").setup({
        logging = false,
        filetype = {
          lua = {
            require("formatter.filetypes.lua").stylua,
          },
          html = {
            require("formatter.filetypes.html").prettierd,
          },
          typescript = {
            require("formatter.filetypes.typescript").prettierd,
          },
          typescriptreact = {
            require("formatter.filetypes.typescriptreact").prettierd,
          },
          javascript = {
            require("formatter.filetypes.javascript").prettierd,
          },
          javascriptreact = {
            require("formatter.filetypes.javascriptreact").prettierd,
          },
        },
      })

      vim.cmd([[
        augroup FormatAutogroup
        autocmd!
        autocmd BufWritePost * FormatWrite
        augroup END
      ]])
    end,
  },
}
