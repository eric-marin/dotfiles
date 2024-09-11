return {
  "lukas-reineke/indent-blankline.nvim",
  lazy = true,
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  main = "ibl",
  opts = {
    exclude = {
      filetypes = {
        "dashboard",
      },
    },
  },
}
