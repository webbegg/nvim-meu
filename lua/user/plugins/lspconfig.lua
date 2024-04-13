return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'j-hui/fidget.nvim',
    'folke/neodev.nvim',
    'nvimdev/lspsaga.nvim',
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        map('gd', '<cmd>Lspsaga goto_definition<cr>', '[G]oto [D]efinition')
        map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        map('<leader>rn', '<cmd>Lspsaga rename<cr>', '[R]e[n]ame')
        map('<leader>ca', '<cmd>Lspsaga code_action<cr>', '[C]ode [A]ction')
        map('K', '<cmd>Lspsaga hover_doc<cr>', 'Hover Documentation')
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    -- LSP Servers
    local servers = {
      eslint_d = {},
      eslint = {},
      tailwindcss = {},
      tsserver = {},
      volar = {},
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
          },
        },
      },
    }

    require('mason').setup()

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua', -- Used to format Lua code
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }

    -- LSP Saga
    require('lspsaga').setup {
      symbol_in_winbar = {
        enable = false,
      },
      lightbulb = {
        enable = false,
        sign = true,
        virtual_text = true,
        debounce = 10,
        sign_priority = 20,
      },
      use_saga_diagnostic_sign = true,

      code_action_prompt = {
        enable = false,
      },
    }

    -- VUE/TYPESCRIPT
    local mason_registry = require 'mason-registry'
    local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server'

    local lspconfig = require 'lspconfig'

    lspconfig.tsserver.setup {
      init_options = {
        plugins = {
          {
            name = '@vue/typescript-plugin',
            location = vue_language_server_path,
            languages = { 'vue' },
          },
        },
      },
      filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    }
    lspconfig.volar.setup {}
  end,
}
