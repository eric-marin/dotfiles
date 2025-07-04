local opts = {
  options = {
    theme = "auto",
    globalstatus = true,
    disabled_filetypes = { "toggleterm", "lazy", "oil", "dashboard", "TelescopePrompt", "oil_preview", "ministarter" }
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff",
      {
        "diagnostics",
        sections = { "error", "warn", "info", "hint" },
        symbols = { error = " ", warn = " ", info = " ", hint = " " },
      }
    },
    lualine_c = {
      {
        require("lazy.status").updates,
        cond = require("lazy.status").has_updates,
        color = { fg = "#ff9e64" },
      },
    },
  },
}

return {
  "nvim-lualine/lualine.nvim",
  lazy = true,
  event = "VeryLazy",
  -- event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  opts = opts,
}
