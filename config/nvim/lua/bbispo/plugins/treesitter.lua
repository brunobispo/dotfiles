return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	disable = true,
	config = function()
		local configs = require("nvim-treesitter.configs")
		---@diagnostic disable-next-line: missing-fields
		configs.setup({
			highlight = { enable = true },
			ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "css", "html", "tsx", "typescript", "graphql" },
		})
	end,
}
