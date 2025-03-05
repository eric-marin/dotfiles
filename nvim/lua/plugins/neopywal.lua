local init = function()
  vim.cmd.colorscheme("neopywal")
end

local opts = {
  use_wallust = true,
  plugins = {
    treesitter = true
  }
}

return {
  "RedsXDD/neopywal.nvim",
  lazy = false,
  name = "neopywal",
  init = init,
  opts = opts,
  priority = 1000,
}
