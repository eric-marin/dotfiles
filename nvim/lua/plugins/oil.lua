local init = function()
  local keymap = vim.keymap
  keymap.set("n", "<Space>b", ":Oil --float .<Enter>",
    { noremap = true, silent = true, desc = "File browser (Oil)" }) -- Oil
end



local config = function()
  require("oil").setup({
    default_file_explorer = true,
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    keymaps = {
      ["o?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["op"] = "actions.preview",
      ["q"] = "actions.close",
      ["or"] = "actions.refresh",
      ["-"] = "actions.parent",
      ["_"] = "actions.open_cwd",
      ["~"] = "actions.cd",
      ["os"] = "actions.change_sort",
      ["o."] = "actions.toggle_hidden",
      ["ot"] = "actions.toggle_trash",
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
