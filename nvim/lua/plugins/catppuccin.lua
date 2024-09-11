local config = function()
  require("catppuccin").setup({
    custom_highlights = function(colors)
      return {
        TodoError = { fg = colors.base, bg = colors.red },
      }
    end,
    integrations = {
      dashboard = true,
      indent_blankline = {
        enabled = true,
        colored_indent_levels = false,
      },
      lsp_saga = false,
      neotree = false,
      cmp = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
          ok = { "italic" },
        },
        underlines = {
          errors = { "undercurl" },
          hints = { "underline" },
          warnings = { "undercurl" },
          information = { "underline" },
          ok = { "underline" },
        },
        inlay_hints = {
          background = true,
        },
      },
      treesitter = true,
      telescope = {
        enabled = true,
        -- style = "nvchad"
      },
      lsp_trouble = false,
      illuminate = {
        enabled = true,
        lsp = false
      },
      which_key = false
    }
  })
  vim.cmd.colorscheme("catppuccin-macchiato")
end

return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  config = config,
}
