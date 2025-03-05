local opts = {
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
    error = "@text.title.1.markdown",
    info = "DiagnosticInfo",
    hack = "@text.title.2.markdown",
    warning = "@text.title.3.markdown",
    perf = "@text.title.4.markdown",
    hint = "@text.title.5.markdown",
    test = "@text.title.6.markdown",
  }
}

return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = true,
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  opts = opts
}

-- FIX: ciao
-- TODO: ciao
-- HACK: ciao
-- WARN: ciao
-- PERF: ciao
-- NOTE: ciao
-- TEST: ciao
