return {
  "williamboman/mason.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require("mason")
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })
    require("mason-lspconfig").setup()
    require("mason-lspconfig").setup_handlers {
      -- The first entry (without a key) will be the default handler
      -- and will be called for each installed server that doesn't have
      -- a dedicated handler.
      function(server_name) -- default handler (optional)
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true

        require("lspconfig")[server_name].setup {
          capabilities = capabilities,
        }
      end,
      -- Next, you can provide a dedicated handler for specific servers.
      -- ["html"] = function()
      --   local capabilities = vim.lsp.protocol.make_client_capabilities()
      --   capabilities.textDocument.completion.completionItem.snippetSupport = true
      --
      --   -- local general_on_attach = function(client, bufnr)
      --   --   if client.resolved_capabilities.completion then
      --   --     require("completion").on_attach(client, bufnr)
      --   --   end
      --   -- end
      --
      --   require('lspconfig').html.setup({
      --     -- Add capabilities
      --     -- on_attach = general_on_attach
      --   })
      -- end,
      -- ["cssls"] = function()
      --   local capabilities = vim.lsp.protocol.make_client_capabilities()
      --   capabilities.textDocument.completion.completionItem.snippetSupport = true
      --   require('lspconfig').cssls.setup({ capabilities = capabilities, })
      -- end,
      ["ts_ls"] = function()
        require('lspconfig').ts_ls.setup({
          init_options = {
            preferences = {
              importModuleSpecifierPreference = "non-relative",
              importModuleSpecifierEnding = "minimal",
            },
          },
        })
      end,
      ["lua_ls"] = function()
        require('lspconfig').lua_ls.setup({
          settings = {
            Lua = {
              runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
              },
              diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {
                  'vim',
                  'require'
                },
              },
              workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
              },
              -- Do not send telemetry data containing a randomized but unique identifier
              telemetry = {
                enable = false,
              },
            },
          },
        })
      end
    }
  end,
}
