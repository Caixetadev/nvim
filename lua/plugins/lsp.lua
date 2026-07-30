return {
  {
    "neovim/nvim-lspconfig",
    -- Was event = { "BufReadPre", "BufNewFile" }. That's lazy-loading by
    -- buffer event, which races with auto-session restoring several
    -- buffers in a burst on VimEnter: this plugin (+ mason + mason-lspconfig)
    -- only *starts* loading on the first buffer's event, and by the time
    -- vim.lsp.enable() actually runs, that buffer's FileType event has
    -- already fired and won't be retroactively caught. Loading eagerly
    -- avoids the race entirely.
    lazy = false,
    dependencies = {
      -- Installs and manages language servers
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
      -- Global defaults, merged into every server's config.
      -- (this replaces lsp-zero's on_attach/capabilities plumbing)
      vim.lsp.config("*", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      -- Server-specific tweaks
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      })

      vim.lsp.config("gopls", {
        settings = {
          gopls = {
            gofumpt = true, -- gofumpt isn't its own LSP server, it's a gopls option
          },
        },
      })

      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "ts_ls", -- renamed from "tsserver"
          "bashls",
          "cssls",
          "dockerls",
          "emmet_ls",
          "golangci_lint_ls",
          "gopls",
          "html",
          "jsonls",
          "lua_ls",
          "prismals",
          "tailwindcss",
          "taplo",
          "yamlls",
          "astro",
          -- "grammarly", -- markdown-only, needs its own account/token setup, add back if you use it
        },
        -- automatic_enable = true is the default: mason-lspconfig will
        -- call vim.lsp.enable() for every installed server above for you.
      })

      -- Keymaps applied to any buffer once a language server attaches
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
        callback = function(event)
          local opts = { buffer = event.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)

          vim.keymap.set("n", "<c-p>", function()
            vim.diagnostic.jump({ count = -1, float = true })
          end, vim.tbl_extend("force", opts, { desc = "lsp: go to prev diagnostic" }))

          vim.keymap.set("n", "<c-n>", function()
            vim.diagnostic.jump({ count = 1, float = true })
          end, vim.tbl_extend("force", opts, { desc = "lsp: go to next diagnostic" }))
        end,
      })
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lua",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "onsails/lspkind-nvim",
      -- "Exafunction/windsurf.nvim", -- add this back (+ nvim-lua/plenary.nvim) if you
      -- want the "codeium" cmp source below; Codeium's Neovim plugin is now windsurf.nvim
    },
    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")
      local luasnip = require("luasnip")

      lspkind.init({})

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },

        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          -- { name = "codeium" }, -- uncomment once windsurf.nvim is installed
        }, {
          { name = "buffer" },
        }),

        preselect = cmp.PreselectMode.None,

        completion = {
          get_trigger_characters = function(chars)
            local new_chars = {}
            for _, char in ipairs(chars) do
              if char ~= " " then
                table.insert(new_chars, char)
              end
            end
            return new_chars
          end,
        },

        window = {
          completion = {
            col_offset = -3, -- align the abbr and word on cursor (due to fields order below)
          },
        },

        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = lspkind.cmp_format({
            mode = "symbol_text", -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
            maxwidth = 50,
            menu = {
              nvim_lsp = "[LSP]",
              buffer = "[Buffer]",
              luasnip = "[LuaSnip]",
              codeium = "[Codeium]",
            },
            before = function(entry, vim_item) -- tailwindcss color swatches
              if vim_item.kind == "Color" and entry.completion_item.documentation then
                local _, _, r, g, b = string.find(entry.completion_item.documentation, "^rgb%((%d+), (%d+), (%d+)")
                if r then
                  local color = string.format("%02x", r) .. string.format("%02x", g) .. string.format("%02x", b)
                  local group = "Tw_" .. color
                  if vim.fn.hlID(group) < 1 then
                    vim.api.nvim_set_hl(0, group, { fg = "#" .. color })
                  end
                  vim_item.kind = "■"
                  vim_item.kind_hl_group = group
                  return vim_item
                end
              end
              vim_item.kind = lspkind.symbolic(vim_item.kind) or vim_item.kind
              return vim_item
            end,
          }),
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),

          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
      })
    end,
  },
}
