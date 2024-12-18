local init = function()
  local keymap = vim.keymap
  keymap.set("n", "<Space>b", ":Oil --float .<Enter>",
    { noremap = true, silent = true, desc = "File browser (Oil)" }) -- Oil
end

local config = function()
  local detail = false
  require("oil").setup({
    default_file_explorer = true,
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    keymaps = {
      ["b?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["bp"] = "actions.preview",
      ["q"] = "actions.close",
      ["br"] = "actions.refresh",
      ["-"] = "actions.parent",
      ["_"] = "actions.open_cwd",
      ["~"] = "actions.cd",
      ["bs"] = "actions.change_sort",
      ["b."] = "actions.toggle_hidden",
      ["bt"] = "actions.toggle_trash",
      ["bd"] = {
        desc = "Toggle file detail view",
        callback = function()
          detail = not detail
          if detail then
            require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
          else
            require("oil").set_columns({ "icon" })
          end
        end,
      },
    },
    use_default_keymaps = false,
  })
end

return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = true,
  cmd = "Oil",
  init = init,
  config = config
}
