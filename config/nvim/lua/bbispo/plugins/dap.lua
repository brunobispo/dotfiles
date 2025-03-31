return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"jay-babu/mason-nvim-dap.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-nvim-dap").setup({
			ensure_installed = { "chrome", "node2" },
			handlers = {
				function(config)
					require("mason-nvim-dap").default_setup(config)
				end,
			},
		})
	end,
}
