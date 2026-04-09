local config = function()
	require("nvim-treesitter.config").setup {
		install_dir = vim.fn.stdpath('data') .. '/site',
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
	}
	require("nvim-treesitter").install {
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
	}
end

return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	build = ":TSUpdate",
	config = config
}
