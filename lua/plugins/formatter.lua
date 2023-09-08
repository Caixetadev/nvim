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
          prisma = {
            function()
              return {
                exe = "prettier",
                args = {
                  "--stdin-filepath",
                  vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                  "--use-tabs",
                  "--tab-width",
                  "4",
                  "--plugin=prettier-plugin-prisma",
                },
                stdin = true,
              }
            end,
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
