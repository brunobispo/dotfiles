return {
	"neovim/nvim-lspconfig",
	config = function()
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
