return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local status, treesitter = pcall(require, "nvim-treesitter.configs")
    if not status then
      return
    end

    treesitter.setup({
      -- enable syntax highlighting
      highlight = {
        enable = true,
      },
      -- enable indentation
      indent = { enable = true },
      autotag = {
        enable = true,
      },
      -- ensure these language parsers are installed
      ensure_installed = {
        "bash",
        "css",
        "dockerfile",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "javascript",
        "json",
        "jsonc",
        "lua",
        "markdown",
        "sql",
        "toml",
        "tsx",
        "typescript",
        "yaml",
        "html",
      },
      -- auto install above language parsers
      auto_install = true,
      -- magic
      sync_install = false,
    })
  end,
}
