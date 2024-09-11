local config = function()
  local lspconfig = require("lspconfig")
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  -- setting custom signs
  local signs = { Error = "", Warn = "", Hint = "", Info = "" }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end

  local on_attach = function(client, bufnr)
    local keymap = vim.keymap
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- setting custom keymaps
    keymap.set("n", "<Space>lf", ":Lspsaga finder<Enter>", opts)          -- go to definition
    keymap.set("n", "<Space>lp", ":Lspsaga peek_definition<Enter>", opts) -- peak definition
    keymap.set("n", "<Space>lg", ":Lspsaga goto_definition<Enter>", opts) -- go to definition
    keymap.set("n", "<Space>la", ":Lspsaga code_action<Enter>", opts)     -- see available code actions
    keymap.set("n", "<Space>lr", ":Lspsaga rename<Enter>", opts)          -- smart rename
    keymap.set("n", "<Space>ld", ":Lspsaga hover_doc<Enter>", opts)       -- show documentation for what is under cursor

    -- enable auto formatting on save
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = true })
        end,
      })
    end
  end

  -- efm server configuration
  lspconfig.efm.setup({
    init_options = {
      documentFormatting = true,
      documentRangeFormatting = true,
      hover = true,
      documentSymbol = true,
      codeAction = true,
      completion = true,
    },
  })
  -- clangd server configuration
  lspconfig.clangd.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
  -- rust analyzer server configuration
  lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
  -- cmake-language-server configuration
  lspconfig.cmake.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
  -- haskell-language-server configuration
  lspconfig.hls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
  -- lua-language-server
  lspconfig.lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
  -- nixd configuration
  lspconfig.nixd.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

return {
  "neovim/nvim-lspconfig",
  config = config,
  lazy = true,
  event = { "BufReadPost", "BufWritePost", "BufNewFile" }
}
