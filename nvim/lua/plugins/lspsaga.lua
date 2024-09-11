return {
  "nvimdev/lspsaga.nvim",
  lazy = true,
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  config = function()
    require("lspsaga").setup({
      -- keybinds for navigation in lspsaga window
      move_in_saga = { prev = "<C-k>", next = "<C-j>" },
      -- use enter to open file with finder
      finder_action_keys = {
        open = "<Enter>"
      },
      -- use enter to open file with definition preview
      definition_action_keys = {
        edit = "<Enter>"
      },
      ui = {
        code_action = "",
      },
    })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons",     -- optional
  },
}
