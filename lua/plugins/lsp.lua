return {
  "VonHeikemen/lsp-zero.nvim",
  -- enabled = false,
  branch = "v1.x",
  dependencies = {
    -- LSP Support
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },

    -- Autocompletion
    { "hrsh7th/nvim-cmp" },
    -- { "hrsh7th/cmp-buffer" },
    -- { "hrsh7th/cmp-path" },
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },
    -- Snippets
    { "L3MON4D3/LuaSnip" },
    { "rafamadriz/friendly-snippets" },
    { "onsails/lspkind-nvim" },

    -- {'ray-x/guihua.lua', build = 'cd lua/fzy && make'},
  },
  config = function()
    local lsp = require("lsp-zero")
    lsp.preset("recommended")

    -- Fix Undefined global 'vim'
    lsp.configure("lua_ls", {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })


    lsp.ensure_installed({
      "tsserver",
      "bashls",
      "cssls",
      "dockerls",
      "emmet_ls",
      "golangci_lint_ls",

      "gopls",
      "grammarly",
      "html",
      "jsonls",
      "lua_ls",
      "prismals",
      "tailwindcss",
      "taplo",
      "yamlls",
    })

    -- require('guihua.maps').setup({
    --   maps = {
    --     close_view = '<C-x>',
    --   }
    -- })

    lsp.on_attach(function(client, bufnr)
      lsp.default_keymaps({ buffer = bufnr })
      vim.keymap.set("n", "<c-p>", function()
        vim.diagnostic.goto_prev({ float = true })
      end, { buffer = bufnr, desc = "lsp: go to prev diagnostic" })

      vim.keymap.set("n", "<c-n>", function()
        vim.diagnostic.goto_next({ float = true })
      end, { buffer = bufnr, desc = "lsp: go to next diagnostic" })
      lsp.default_keymaps({ buffer = bufnr })

      vim.keymap.set("n", "<space>ca", function()
        vim.lsp.buf.code_action()
      end, { buffer = bufnr, desc = "lsp: code action" })
    end)

    lsp.setup()

    local cmp = require("cmp")
    local lspkind = require("lspkind")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local nvim_lsp = require("lspconfig")

    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
      local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
      end

      --Enable completion triggered by <c-x><c-o>
      --local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
      --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- Mappings.
      local opts = { noremap = true, silent = true }

      -- See `:help vim.lsp.*` for documentation on any of the below functions
      buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
      --buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
      buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
      --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    end

    nvim_lsp.tailwindcss.setup({
      on_attach = on_attach,
      capabilities = capabilities, -- Utilize as capacidades do LSP definidas anteriormente
    })

    lspkind.init({})

    cmp.setup({
      sources = {
        { name = "nvim_lsp" },
        { name = "codeium" },
        { name = 'buffer' },
      },
      preselect = require("cmp").PreselectMode.None,
      complete = {
        completeopt = menu,
        menuone,
        noinsert,
        noselect,
      },
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

      -- experimental = {
      --   ghost_text = { hlgroup = "Comment" },
      -- },

      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = lspkind.cmp_format({
          mode = "symbol_text", -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
          maxwidth = 50,        -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
          menu = {              -- showing type in menu
            nvim_lsp = "[LSP]",
            -- path = "[Path]",
            buffer = "[Buffer]",
            luasnip = "[LuaSnip]",
            codeium = "[Codeium]"
          },

          before = function(entry, vim_item) -- for tailwind css autocomplete
            if vim_item.kind == "Color" and entry.completion_item.documentation then
              local _, _, r, g, b = string.find(entry.completion_item.documentation, "^rgb%((%d+), (%d+), (%d+)")
              if r then
                local color = string.format("%02x", r) .. string.format("%02x", g) .. string.format("%02x", b)
                local group = "Tw_" .. color
                if vim.fn.hlID(group) < 1 then
                  vim.api.nvim_set_hl(0, group, { fg = "#" .. color })
                end
                vim_item.kind = "■" -- or "⬤" or anything
                vim_item.kind_hl_group = group
                return vim_item
              end
            end
            -- vim_item.kind = icons[vim_item.kind] and (icons[vim_item.kind] .. vim_item.kind) or vim_item.kind
            -- or just show the icon
            vim_item.kind = lspkind.symbolic(vim_item.kind) and lspkind.symbolic(vim_item.kind) or vim_item.kind
            return vim_item
          end,
        }),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      -- completion = {
      --   keyword_length = 1,
      --   keyword_pattern = [[\k\+]],
      --   map_select = false,
      -- },

      -- performance = {
      -- trigger_debounce_time = 0,
      -- throttle = 0,
      -- fetching_timeout = 0,
      -- },
    })
  end,
}
