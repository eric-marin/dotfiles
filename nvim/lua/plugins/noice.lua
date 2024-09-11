local config = function()
  require("notify").setup({
    render = "wrapped-compact",
    max_width = 50
  })
end

return {
  "folke/noice.nvim",
  lazy = true,
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    {
      "rcarriga/nvim-notify",
      config = config,
    },
  },
}
