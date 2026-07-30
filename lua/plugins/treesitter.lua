return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main", -- master is frozen and broken on Neovim 0.12+
  lazy = false,
  build = ":TSUpdate",
  -- init = function()
  --   -- Registered in `init`, which lazy.nvim runs immediately, before the
  --   -- first buffer's FileType event fires. Doing this via opts.highlight
  --   -- instead runs too late for the very first file Neovim opens (e.g.
  --   -- `nvim somefile.go`), which is why only the *second* file onward
  --   -- was getting highlighted.
  --   vim.api.nvim_create_autocmd("FileType", {
  --     callback = function()
  --       pcall(vim.treesitter.start)
  --       vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  --     end,
  --   })
  -- end,
  opts = {
    -- auto_install / sync_install were removed on the new branch;
    -- ensure_installed still works and is handled by :TSUpdate / the
    -- build step above.
    -- "lua" and "markdown" are deliberately left out: Neovim 0.12 bundles
    -- its own parser + queries for c/lua/vim/vimdoc/markdown natively, and
    -- installing a second copy here causes the two query files to get
    -- concatenated and checked against a grammar version they disagree on
    -- (this is what caused the "Invalid field name" crash). Let Neovim's
    -- native support own those languages exclusively.
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
      "sql",
      "toml",
      "tsx",
      "typescript",
      "yaml",
      "html",
      "hcl",
      "terraform",
      "astro",
    },
  },
}
