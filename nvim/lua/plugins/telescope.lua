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
  keymap.set("n", "<Space>tg", ":Telescope live_grep<Enter>", opts)  -- Find words
  opts.desc = "Buffers (Telescope)"
  keymap.set("n", "<Space>tb", ":Telescope buffers<Enter>", opts)    -- Buffers
end

local opts = {
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
}

return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = true,
  cmd = "Telescope",
  init = init,
  opts = opts,
}
