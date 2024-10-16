local config = function()
  require("todo-comments").setup({
    keywords = {
      FIX  = { icon = "", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
      TODO = { icon = "", color = "info" },
      HACK = { icon = "", color = "hack" },
      WARN = { icon = "", color = "warning", alt = { "WARNING", "XXX" } },
      PERF = { icon = "󰅒", color = "perf", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = "", color = "hint", alt = { "INFO" } },
      TEST = { icon = "", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    },
    colors = {
      error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
      warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
      info = { "DiagnosticInfo", "#2563EB" },
      hint = { "DiagnosticHint", "#10B981" },
      test = { "Identifier", "#FF00FF" },
      hack = "#F5A97F",
      perf = "#C6A0F6"
    }
  })
end

return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = true,
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  config = config
}

-- FIX: ciao
-- TODO: ciao
-- HACK: ciao
-- WARN: ciao
-- PERF: ciao
-- NOTE: ciao
-- TEST: ciao
