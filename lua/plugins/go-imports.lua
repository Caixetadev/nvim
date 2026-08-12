return {
  "neovim/nvim-lspconfig",

  init = function()
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",

      callback = function()
        local clients = vim.lsp.get_clients({
          bufnr = 0,
          name = "gopls",
        })

        if #clients == 0 then
          return
        end

        local client = clients[1]

        local params = vim.lsp.util.make_range_params(0, client.offset_encoding or "utf-16")

        params.context = {
          only = { "source.organizeImports" },
        }

        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)

        for _, res in pairs(result or {}) do
          for _, action in pairs(res.result or {}) do
            if action.edit then
              vim.lsp.util.apply_workspace_edit(action.edit, client.offset_encoding or "utf-16")
            elseif action.command then
              vim.lsp.buf.execute_command(action.command)
            end
          end
        end
      end,
    })
  end,
}
