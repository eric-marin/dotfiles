local config = function()
  local cmp = require("cmp")
  vim.opt.completeopt = "menu,menuone"

  cmp.setup({
    formatting = {
      expandable_indicator = false,
      fields = { "abbr", "kind" },
      format = require("lspkind").cmp_format({
        mode = "text_symbol",
        maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
        ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
        before = function(_, vim_item)
          vim_item.menu = ""
          return vim_item
        end
      })
    },
    snippet = {
      expand = function(args)
        vim.snippet.expand(args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = {
      ["<TAB>"] = cmp.mapping.select_next_item(),
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources(
      {
        { name = "nvim_lsp" },
      }, {
        { name = "buffer" },
      }, {
        { name = "path" },
      }, {
        { name = "lazydev", group_index = 0 }
      }
    )
  })
end

return {
  "hrsh7th/nvim-cmp",
  lazy = true,
  event = "InsertEnter",
  config = config,
  dependencies = {
    "neovim/nvim-lspconfig",
    "onsails/lspkind.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
  },
}
