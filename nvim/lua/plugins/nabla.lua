local config = function()
  vim.keymap.set("n", "<Space>x", function()
    require("nabla").popup({ border = "rounded" })
  end, { desc = "Popup Math" })
  vim.keymap.set("n", "<Space>xx", function()
    require "nabla".toggle_virt({
      autogen = true, -- auto-regenerate ASCII art when exiting insert mode
      silent = true,  -- silents error messages
    })
  end, { desc = "Toggle Math" })
end

return {
  "jbyuki/nabla.nvim",
  ft = "norg",
  config = config
}
