local config = function()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"c",
			"lua",
			"markdown",
			"vim",
			"vimdoc",
			"query",

			"regex",
			"diff",
			"cmake",
			"meson",
			"markdown_inline",
			"bash",
			"toml",
			"latex",

			"cpp",
			"rust",
			"haskell",
			"nix",
			"javascript",
			"norg",
			"fish",
			"kdl",
			"bend",
		},
		auto_install = false,
		sync_install = false,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		incremental_selection = {
			enable = true
		},
		indent = {
			enable = true,
		},
		autotag = {
			enable = true,
		},
	})

	vim.filetype.add({
		extension = {
			bend = "bend",
		},
	})

	vim.treesitter.language.register("bend", { "bend" })

	vim.cmd(":TSUpdate")
end

return {
	"nvim-treesitter/nvim-treesitter",
	lazy = true,
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	config = config,
}
