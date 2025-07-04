return {
	"yetone/avante.nvim",
	enabled = false, -- Plugin is now disabled
	event = "VeryLazy",
	version = false, -- Never set this value to "*"! Never!
	opts = {
		provider = "claude",
		cursor_applying_provider = "groq",
		mode = "legacy",
		behaviour = {
			auto_suggestions = false, -- Experimental stage
			enable_cursor_planning_mode = true, -- enable cursor planning mode!
		},
		openai = {
			endpoint = "https://api.openai.com/v1",
			model = "o4-mini", -- your desired model (or use gpt-4o, etc.)
			timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
			temperature = 0,
			max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
			reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
		},
		groq = { -- define groq provider
			__inherited_from = "openai",
			api_key_name = "GROQ_API_KEY",
			endpoint = "https://api.groq.com/openai/v1/",
			model = "llama-3.3-70b-versatile",
			max_completion_tokens = 32768, -- remember to increase this value, otherwise it will stop generating halfway
		},
		claude = {
			endpoint = "https://api.anthropic.com",
			model = "claude-3-7-sonnet-latest",
			temperature = 0,
			max_tokens = 8192,
		},
		ollama = {
			endpoint = "http://127.0.0.1:11434",
			model = "deepseek-coder:1.3b",
		},
	},
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	build = "make",
	-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
		"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
		"ibhagwan/fzf-lua", -- for file_selector provider fzf
	},
}
