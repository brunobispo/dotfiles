return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		"antosha417/nvim-lsp-file-operations",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				window = {
					mappings = {
						["o"] = "system_open",
					},
				},
			},
			commands = {
				system_open = function(state)
					local node = state.tree:get_node()
					local path = node:get_id()
					-- macOs: open file in default application in the background.
					vim.fn.jobstart({ "xdg-open", "-g", path }, { detach = true })
					-- Linux: open file in default application
					vim.fn.jobstart({ "xdg-open", path }, { detach = true })

					-- Windows: Without removing the file from the path, it opens in code.exe instead of explorer.exe
					local p
					local lastSlashIndex = path:match("^.+()\\[^\\]*$") -- Match the last slash and everything before it
					if lastSlashIndex then
						p = path:sub(1, lastSlashIndex - 1) -- Extract substring before the last slash
					else
						p = path -- If no slash found, return original path
					end
					vim.cmd("silent !start explorer " .. p)
				end,
			},
		})

		vim.keymap.set("n", "<leader>\\", ":Neotree toggle<cr>", { noremap = true })
		vim.keymap.set("n", "<leader>|", ":Neotree reveal=true<cr>", { noremap = true })

		require("lsp-file-operations").setup()
	end,
}
