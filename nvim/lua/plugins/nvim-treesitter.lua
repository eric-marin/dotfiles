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
    },
    auto_install = false,
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

  vim.cmd(":TSUpdate")
end

return {
  "nvim-treesitter/nvim-treesitter",
  lazy = true,
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  config = config,
}
