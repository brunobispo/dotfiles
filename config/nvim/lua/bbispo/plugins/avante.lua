return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	version = "*", -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
	opts = {
		provider = "openai",
		openai = {
			model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
			temperature = 0, -- adjust if needed
			max_tokens = 4096,
			-- reasoning_effort = "high", -- only supported for "o" models
		},
		rag_service = {
			enabled = false, -- Enables the rag service, requires OPENAI_API_KEY to be set
		},
		mappings = {
			files = {
				add_current = "<leader>af",
			},
		},
	},
	build = "make",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
		"zbirenbaum/copilot.lua", -- for providers='copilot'
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					-- required for Windows users
					use_absolute_path = true,
				},
			},
		},
		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
