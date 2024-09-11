local init = function()
  local keymap = vim.keymap
  keymap.set("n", "<Space>tk", ":Telescope keymaps<Enter>",
    { noremap = true, silent = true, desc = "Keymaps (Telescope)" })      -- Keymaps
  keymap.set("n", "<Space>th", ":Telescope help_tags<Enter>",
    { noremap = true, silent = true, desc = "Help (Telescope)" })         -- Help
  keymap.set("n", "<Space>tf", ":Telescope find_files<Enter>",
    { noremap = true, silent = true, desc = "Find files (Telescope)" })   -- Find files
  keymap.set("n", "<Space>ta", ":Telescope<Enter>",
    { noremap = true, silent = true, desc = "All commands (Telescope)" }) -- All commands
  keymap.set("n", "<Space>tg", ":Telescope live_grep<Enter>",
    { noremap = true, silent = true, desc = "Find words (Telescope)" })   -- Find words
  keymap.set("n", "<Space>tb", ":Telescope buffers<Enter>",
    { noremap = true, silent = true, desc = "Buffers (Telescope)" })      -- Buffers
end

local config = function()
  local telescope = require("telescope")
  telescope.setup({
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous",
        },
      },
    },
    picker = {
      find_files = {
        theme = "dropdown",
        previewer = false,
        hidden = true,
      },
      live_grep = {
        theme = "dropdown",
        previewer = false,
      },
      find_buffers = {
        theme = "dropdown",
        previewer = false,
      },
    },
  })
end

return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = true,
  cmd = "Telescope",
  init = init,
  config = config
}
