local cmp = require("cmp")

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  --local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  --buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

nvim_lsp.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities, -- Utilize as capacidades do LSP definidas anteriormente
}

cmp.setup {
  sources = cmp.config.sources({
    {
      name = "nvim_lsp",
      entry_filter = function(entry)
        return require("cmp").lsp.CompletionItemKind.Snippet ~= entry:get_kind()
      end
    },
    -- { name = 'buffer' },
  }),
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  -- completion = {
  --   keyword_length = 1,
  --   keyword_pattern = [[\k\+]],
  --   map_select = false,
  -- },

  completion = {
    get_trigger_characters = function(chars)
      local new_chars = {}
      for _, char in ipairs(chars) do
        if char ~= ' ' then
          table.insert(new_chars, char)
        end
      end
      return new_chars
    end
  },

  -- performance = {
    -- trigger_debounce_time = 0,
    -- throttle = 0,
    -- fetching_timeout = 0,
  -- },
}
