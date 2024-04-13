return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "lukas-reineke/lsp-format.nvim",
    "b0o/schemastore.nvim",
    { "jose-elias-alvarez/null-ls.nvim", dependencies = "nvim-lua/plenary.nvim" },
    "jayp0521/mason-null-ls.nvim",
  },
  config = function()
    -- Setup Mason to automatically install LSP servers
    require("mason").setup {
      ui = {
        height = 0.8,
      },
    }
    require("mason-lspconfig").setup { automatic_installation = true }
    require("lsp-format").setup {}

    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

    -- local mason_registry = require('mason-registry')
    -- local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server'
    --
    -- local lspconfig = require('lspconfig')
    --
    -- lspconfig.tsserver.setup {
    --   init_options = {
    --     plugins = {
    --       {
    --         name = '@vue/typescript-plugin',
    --         location = vue_language_server_path,
    --         languages = { 'vue' },
    --       },
    --     },
    --   },
    --   filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    -- }
    --
    -- -- No need to set `hybridMode` to `true` as it's the default value
    -- lspconfig.volar.setup {}

    local lspconfig = require('lspconfig')
    lspconfig.volar.setup {
      filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
      init_options = {
        vue = {
          hybridMode = false,
        },
      },
    }

    --Eslint
    require("lspconfig").eslint.setup { capabilities = capabilities }

    -- Tailwind CSS
    require("lspconfig").tailwindcss.setup { capabilities = capabilities }

    -- Eslint
    require("lspconfig").eslint.setup { capabilities = capabilities }

    -- JSON
    require("lspconfig").jsonls.setup {
      capabilities = capabilities,
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
        },
      },
    }

    -- null-ls
    local null_ls = require "null-ls"
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    null_ls.setup {
      temp_dir = "/tmp",
      sources = {
        null_ls.builtins.diagnostics.eslint_d.with {
          condition = function(utils)
            return utils.root_has_file { ".eslintrc.js" }
          end,
        },
        null_ls.builtins.diagnostics.trail_space.with { disabled_filetypes = { "NvimTree" } },
        null_ls.builtins.formatting.eslint_d.with {
          condition = function(utils)
            return utils.root_has_file { ".eslintrc.js", ".eslintrc.json" }
          end,
        },
        null_ls.builtins.formatting.pint.with {
          condition = function(utils)
            return utils.root_has_file { "vendor/bin/pint" }
          end,
        },
        null_ls.builtins.formatting.prettier.with {
          condition = function(utils)
            return utils.root_has_file {
              ".prettierrc",
              ".prettierrc.json",
              ".prettierrc.yml",
              ".prettierrc.js",
              "prettier.config.js",
            }
          end,
        },
      },
      on_attach = function(client, bufnr)
        if client.supports_method "textDocument/formatting" then
          vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format { bufnr = bufnr, timeout_ms = 5000 }
            end,
          })
        end
      end,
    }

    require("mason-null-ls").setup { automatic_installation = true }

    -- Keymaps
    vim.keymap.set("n", "<Leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>")
    vim.keymap.set("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
    vim.keymap.set("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>")
    vim.keymap.set("n", "gd", ":Telescope lsp_definitions<CR>")
    vim.keymap.set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
    vim.keymap.set("n", "gi", ":Telescope lsp_implementations<CR>")
    vim.keymap.set("n", "gr", ":Telescope lsp_references<CR>")
    vim.keymap.set("n", "<Leader>lr", ":LspRestart<CR>", { silent = true })
    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
    vim.keymap.set("n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")

    -- Commands
    vim.api.nvim_create_user_command("Format", function()
      vim.lsp.buf.format { timeout_ms = 5000 }
    end, {})

    -- Diagnostic configuration
    vim.diagnostic.config {
      virtual_text = false,
      float = {
        source = true,
      },
    }

    -- Sign configuration
    vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
  end,
}
