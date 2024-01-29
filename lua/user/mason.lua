local M = {
  "williamboman/mason-lspconfig.nvim",
  commit = "e7b64c11035aa924f87385b72145e0ccf68a7e0a",
  dependencies = {
    "williamboman/mason.nvim",
    "nvim-lua/plenary.nvim",
    "folke/neoconf.nvim",
  },
}

M.servers = {
  "lua_ls",
  "cssls",
  "html",
  -- "tsserver",
  "astro",
  "pyright",
  "bashls",
  "jsonls",
  "yamlls",
  "marksman",
  "tailwindcss",
  "volar",
  "eslint",
  "emmet_ls",
}

function M.config()
  require("mason").setup {
    ui = {
      border = "rounded",
    },
  }

  require("mason-lspconfig").setup {
    ensure_installed = M.servers,
  }

  local lspconfig = require "lspconfig"
  require("mason-lspconfig").setup_handlers {
    function(server_name)
      local server_config = {}
      if require("neoconf").get(server_name .. ".disable") then
        return
      end
      if server_name == "volar" then
        server_config.filetypes = {
          "vue",
          "javascript",
          "javascript.jsx",
          "typescript",
          "typescript.tsx",
          "javascriptreact",
          "typescriptreact",
          "json",
        }
      end
      lspconfig[server_name].setup(server_config)
    end,
  }
end

return M
