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
		require("mason-lspconfig").setup_handlers({
			function(server_name) -- default handler (optional)
				local capabilities = require("cmp_nvim_lsp").default_capabilities()
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["ts_ls"] = function()
				local capabilities = require("cmp_nvim_lsp").default_capabilities()
				require("lspconfig").ts_ls.setup({
					capabilities = capabilities,
					init_options = {
						maxTsServerMemory = 16384,
						preferences = {
							importModuleSpecifierPreference = "non-relative",
							importModuleSpecifierEnding = "minimal",
							disableAutomaticTypingAcquisition = true,
						},
					},
				})
			end,
			["lua_ls"] = function()
				local capabilities = require("cmp_nvim_lsp").default_capabilities()
				require("lspconfig").lua_ls.setup({
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
			end,
		})
	end,
}
