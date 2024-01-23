return {
  url = "https://gitlab.com/schrieveslaach/sonarlint.nvim",
  ft = "go",
  enabled = false, -- <<< here
  config = function()
    require("sonarlint").setup({
      server = {
        cmd = {
          "sonarlint-language-server",
          "-stdio",
          "-analyzers",
          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonargo.jar"),
        },
      },
      filetypes = {
        "go",
      },
    })
  end,
}
