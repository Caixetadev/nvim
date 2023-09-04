return {
  "olexsmir/gopher.nvim",
  ft = "go",
  dependencies = {
    "leoluz/nvim-dap-go"
  },
  config = function()
    local gopher = require("gopher")
    gopher.setup({
      commands = {
        go = "go",
        gomodifytags = "gomodifytags",
        gotests = "gotests",
        impl = "impl",
        iferr = "iferr",
      },
      goimport = "gopls",
      gofmt = "gopls",
    })
  end,
  -- Optional: disable lazy loading
  -- and force the plugin to load immediately
  -- when Neovim starts up.
  -- However, keep in mind that this can slow down
  -- Neovim's startup time, especially if you have many plugins.
  -- Uncomment the following line to disable lazy loading.
  -- cmd = "packadd! gopher.nvim",
}
