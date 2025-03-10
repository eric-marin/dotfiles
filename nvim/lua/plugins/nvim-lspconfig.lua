local config = function()
  local lspconfig = require("lspconfig")
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  -- setting custom signs
  local signs = { Error = "", Warn = "", Hint = "", Info = "" }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end

  local on_attach = function(client, bufnr)
    local keymap = vim.keymap
    local lsp = vim.lsp
    local opts = { noremap = true, silent = true, buffer = bufnr, desc = "" }

    -- setting custom keymaps
    opts.desc = "Finder"
    keymap.set("n", "<Space>lf", ":Lspsaga finder<Enter>", opts)                     -- go to definition
    opts.desc = "Peek Definition (Lspsaga)"
    keymap.set("n", "<Space>lp", ":Lspsaga peek_definition<Enter>", opts)            -- peak definition
    opts.desc = "Goto Definition (Lspsaga)"
    keymap.set("n", "<Space>lg", ":Lspsaga goto_definition<Enter>", opts)            -- go to definition
    opts.desc = "Code Action (Lspsaga)"
    keymap.set("n", "<Space>la", ":Lspsaga code_action<Enter>", opts)                -- see available code actions
    opts.desc = "Rename (Lspsaga)"
    keymap.set("n", "<Space>lr", ":Lspsaga rename<Enter>", opts)                     -- smart rename
    opts.desc = "Hover Documentation (Lspsaga)"
    keymap.set("n", "<Space>lk", lsp.buf.hover, opts)                                -- show documentation for what is under cursor
    opts.desc = "Outline (Lspsaga)"
    keymap.set("n", "<Space>lo", ":Lspsaga outline<Enter>", opts)                    -- show outline
    opts.desc = "Diagnostic (Lspsaga)"
    keymap.set("n", "<Space>ld", ":Lspsaga show_workspace_diagnostics<Enter>", opts) -- show diagnostics

    keymap.del("n", "K", { buffer = bufnr })

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
  -- lspconfig.efm.setup({
  --   init_options = {
  --     documentFormatting = true,
  --     documentRangeFormatting = true,
  --     hover = true,
  --     documentSymbol = true,
  --     codeAction = true,
  --     completion = true,
  --   },
  -- })
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
  -- haskell-language-server configuration
  lspconfig.hls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
  -- lua-language-server configuration
  lspconfig.lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
  lspconfig.ts_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
  -- cssls-language-server configuration
  lspconfig.cssls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
  -- mesonlsp configuration
  lspconfig.mesonlsp.setup({
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
