local init = function()
  local keymap = vim.keymap
  keymap.set("n", "<Space>rd", ":Trouble diagnostics toggle<Enter>",
    { noremap = true, silent = true, desc = "Diagnostics (Trouble)" }) -- Diagnostics
  keymap.set("n", "<Space>rt", ":Trouble todo toggle<Enter>",
    { noremap = true, silent = true, desc = "Todos (Trouble)" })       -- Todos
  keymap.set("n", "<Space>ro", ":Trouble symbols toggle<Enter>",
    { noremap = true, silent = true, desc = "Outline (Trouble)" })     -- Outline
end

local config = function()
  require("trouble").setup({
    use_diagnostic_signs = true
  })
end

return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = true,
  cmd = "Trouble",
  init = init,
  config = config
}
