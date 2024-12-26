local init = function()
  vim.cmd.colorscheme("neopywal")
end

local config = function()
  require("neopywal").setup({
    use_wallust = true,
  })
end

return {
  "RedsXDD/neopywal.nvim",
  lazy = false,
  name = "neopywal",
  init = init,
  config = config,
  priority = 1000,
}
