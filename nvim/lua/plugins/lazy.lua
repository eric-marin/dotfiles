local init = function()
  local keymap = vim.keymap
  keymap.set("n", "<Space>p", ":Lazy home<Enter>",
    { noremap = true, silent = true, desc = "Plugin Manager (Lazy)" })
end


return {
  "folke/lazy.nvim",
  lazy = false,
  init = init
}
