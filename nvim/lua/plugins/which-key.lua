local config = function()
  require("which-key").setup()
  vim.o.timeout = true
  vim.o.timeoutlen = 500
end

return {
  "folke/which-key.nvim",
  lazy = true,
  event = "VeryLazy",
  config = config,
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  dependencies = {
    "echasnovski/mini.icons",
    "nvim-tree/nvim-web-devicons", -- optional
  },
}
