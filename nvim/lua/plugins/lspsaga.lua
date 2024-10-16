local config = function()
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
    diagnostic = {
      diagnostic_only_current = true,
    }
  })
  vim.diagnostic.config({
    virtual_text = false
  })
end

return {
  "nvimdev/lspsaga.nvim",
  lazy = true,
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  config = config,
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons",     -- optional
  },
}
