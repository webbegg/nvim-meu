local M = {
  "jose-elias-alvarez/null-ls.nvim",
}

function M.config()
  local null_ls = require "null-ls"
  local formatting = null_ls.builtins.formatting
  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

  null_ls.setup {
    sources = {
      formatting.stylua,

      formatting.gofumpt,
      formatting.goimports_reviser,
      formatting.golines,

      -- formatting.eslint_d,
      null_ls.builtins.diagnostics.eslint_d,
    },
    on_attach = function(client, bufnr)
      if client.supports_method "textDocument/formatting" then
        vim.api.nvim_clear_autocmds {
          group = augroup,
          buffer = bufnr,
        }
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format { bufnr = bufnr }
          end,
        })
      end
    end,
  }
end

return M
