local init = function()
	vim.cmd.colorscheme("neopywal")
end

local config = function()
	require("neopywal").setup({
		plugins = {
			treesitter = true
		},
		custom_colors = {},
		custom_highlights = {},
		use_palette = {
			light = "wallust",
			dark = "wallust",
		},
	})
end

return {
	"RedsXDD/neopywal.nvim",
	lazy = false,
	name = "neopywal",
	init = init,
	config = config,
	priority = 1000,
}
