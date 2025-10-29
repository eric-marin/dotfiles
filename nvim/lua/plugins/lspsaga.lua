local config = function()
	vim.diagnostic.config({
		severity_sort = true,
		virtual_lines = true,
		virtual_text = false
	})
	require("lspsaga").setup({
		ui = {
			code_action = "",
		},
		outline = {
			keys = {
				toggle_or_jump = "<Enter>"
			}
		},
		finder = {
			keys = {
				toggle_or_open = "<Enter>",
				shuttle = "<Tab>",
			}
		},
	})
end

return {
	"nvimdev/lspsaga.nvim",
	lazy = true,
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	config = config,
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons",   -- optional
	},
}
