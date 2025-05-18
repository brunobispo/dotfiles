return {
  "neovim/nvim-lspconfig",
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }

    vim.lsp.config('lua_ls', {
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = "LuaJIT",
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {
              "vim",
              "require",
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

    vim.lsp.config('ts_ls', {
      capabilities = capabilities,
      init_options = {
        maxTsServerMemory = 16384,
        preferences = {
          importModuleSpecifierPreference = "non-relative",
          importModuleSpecifierEnding = "minimal",
          disableAutomaticTypingAcquisition = true,
          includeCompletionsForModuleExports = false,
        },
      },
    })

    vim.lsp.config('graphql', {
      capabilities = capabilities,
      filetypes = { "graphql", "javascript", "typescript", "javascriptreact", "typescriptreact" },
      root_dir = require("lspconfig").util.root_pattern(".graphqlconfig", ".graphqlrc", "package.json"),
      flags = {
        debounce_text_changes = 150,
      },
    })



    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        vim.keymap.set("n", "<leader>ac", ":lua vim.lsp.buf.code_action()<cr>", { buffer = args.buf })
        vim.keymap.set("n", "<leader>rn", ":lua vim.lsp.buf.rename()<cr>", { buffer = args.buf })
        vim.keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<cr>", { buffer = args.buf })
        vim.keymap.set("n", "[g", ":lua vim.diagnostic.goto_prev()<cr>", { buffer = args.buf })
        vim.keymap.set("n", "]g", ":lua vim.diagnostic.goto_next()<cr>", { buffer = args.buf })
        vim.keymap.set("n", "]g", ":lua vim.diagnostic.goto_next()<cr>", { buffer = args.buf })
      end,
    })
  end,
}
