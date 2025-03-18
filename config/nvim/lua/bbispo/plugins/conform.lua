return {
	"stevearc/conform.nvim",
	dependencies = {
		{
			"williamboman/mason.nvim",
			opts = function(_, opts)
				opts.ensure_installed = opts.ensure_installed or {}
				table.insert(opts.ensure_installed, "js-debug-adapter")
			end,
		},
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		local formatters_by_ft = {
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescriptreact = { "prettierd" },
			svg = { "prettierd" },
			svelte = { "prettierd" },
			css = { "prettierd" },
			html = { "prettierd" },
			json = { "prettierd" },
			yaml = { "prettierd" },
			markdown = { "prettierd" },
			graphql = { "prettierd" },
			lua = { "stylua" },
			python = { "isort", "black" },
		}

		-- use biome if it's in package.json
		local package_json = vim.fn.getcwd() .. "/package.json"
		if vim.fn.filereadable(package_json) == 1 then
			local package = vim.fn.json_decode(vim.fn.readfile(package_json))
			if package and package.devDependencies and package.devDependencies["@biomejs/biome"] then
				for _, ft in ipairs({ "javascript", "typescript", "javascriptreact", "typescriptreact" }) do
					formatters_by_ft[ft] = { "biome" }
				end
			end
		end

		conform.setup({
			formatters_by_ft = formatters_by_ft,
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>ff", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
