return {
	"rose-pine/neovim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		require("rose-pine").setup({
			variant = "main", -- auto, main, moon, or dawn
		})
		-- vim.o.background = "dark"
		vim.cmd([[colorscheme rose-pine]])
	end,
}
