local init = function()
  local keymap = vim.keymap
  local opts = { noremap = true, silent = true, desc = "" }
  opts.desc = "Keymaps (Telescope)"
  keymap.set("n", "<Space>tk", ":Telescope keymaps<Enter>", opts)    -- Keymaps
  opts.desc = "Help (Telescope)"
  keymap.set("n", "<Space>th", ":Telescope help_tags<Enter>", opts)  -- Help
  opts.desc = "Find files (Telescope)"
  keymap.set("n", "<Space>tf", ":Telescope find_files<Enter>", opts) -- Find files
  opts.desc = "All commands (Telescope)"
  keymap.set("n", "<Space>ta", ":Telescope<Enter>", opts)            -- All commands
  opts.desc = "Find words (Telescope)"
  keymap.set("n", "<Space>tw", ":Telescope live_grep<Enter>", opts)  -- Find words
  opts.desc = "Buffers (Telescope)"
  keymap.set("n", "<Space>tb", ":Telescope buffers<Enter>", opts)    -- Buffers
end

local config = function()
  require("telescope").setup({
    defaults = require("telescope.themes").get_ivy(),
    pickers = {
      find_files = {
        hidden = true,
      },
      builtin = {
        previewer = false,
      },
      help_tags = {
        previewer = false,
      }
    },
  })
end

return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = true,
  cmd = "Telescope",
  init = init,
  config = config,
}
