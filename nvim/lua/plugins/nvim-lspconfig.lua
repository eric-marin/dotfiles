local config = function()
	local lsp = vim.lsp
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	-- setting custom signs
	local signs = { Error = "", Warn = "", Hint = "", Info = "" }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	vim.api.nvim_create_autocmd('LspAttach', {
		callback = function(ev)
			local client = lsp.get_client_by_id(ev.data.client_id)
			local keymap = vim.keymap
			local opts = { noremap = true, silent = true, buffer = ev.buf, desc = "" }

			-- setting custom keymaps
			opts.desc = "Finder"
			keymap.set("n", "<Space>lf", ":Lspsaga finder<Enter>", opts)                  -- go to definition
			opts.desc = "Peek Definition (Lspsaga)"
			keymap.set("n", "<Space>lp", ":Lspsaga peek_definition<Enter>", opts)         -- peak definition
			opts.desc = "Goto Definition (Lspsaga)"
			keymap.set("n", "<Space>lg", ":Lspsaga goto_definition<Enter>", opts)         -- go to definition
			opts.desc = "Code Action (Lspsaga)"
			keymap.set("n", "<Space>la", ":Lspsaga code_action<Enter>", opts)             -- see available code actions
			opts.desc = "Rename (Lspsaga)"
			keymap.set("n", "<Space>lr", ":Lspsaga rename<Enter>", opts)                  -- smart rename
			opts.desc = "Hover Documentation (Lspsaga)"
			keymap.set("n", "<Space>lk", lsp.buf.hover, opts)                             -- show documentation for what is under cursor
			opts.desc = "Outline (Lspsaga)"
			keymap.set("n", "<Space>lo", ":Lspsaga outline<Enter>", opts)                 -- show outline
			opts.desc = "Diagnostic (Lspsaga)"
			keymap.set("n", "<Space>ld", ":Lspsaga show_workspace_diagnostics<Enter>", opts) -- show diagnostics

			-- enable auto formatting on save
			if client ~= nil and client:supports_method("textDocument/formatting") then
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = ev.buf,
					callback = function()
						lsp.buf.format({ async = true })
					end,
				})
			end
		end
	})

	vim.api.nvim_create_autocmd('LspDetach', {
		callback = function(ev)
			local client = lsp.get_client_by_id(ev.data.client_id)
			local keymap = vim.keymap
			keymap.del("n", "<Space>lf")
			keymap.del("n", "<Space>lp")
			keymap.del("n", "<Space>lg")
			keymap.del("n", "<Space>la")
			keymap.del("n", "<Space>lr")
			keymap.del("n", "<Space>lk")
			keymap.del("n", "<Space>lo")
			keymap.del("n", "<Space>ld")
			if client ~= nil and client:supports_method('textDocument/formatting') then
				vim.api.nvim_clear_autocmds({
					event = 'BufWritePre',
					buffer = ev.buf,
				})
			end
		end,
	})

	-- C/C++
	lsp.enable("clangd")
	lsp.config("clangd", {
		capabilities = capabilities,
	})
	-- Rust
	lsp.enable("rust_analyzer")
	lsp.config("rust_analyzer", {
		capabilities = capabilities,
	})
	-- Haskell
	lsp.enable("hls")
	lsp.config("hls", {
		capabilities = capabilities,
		settings = {
			['haskell'] = {
				cabalFormattingProvider = "cabalfmt",
				formattingProvider = "ormolu"
			},
		},
	})
	-- Lua
	lsp.enable("lua_ls")
	lsp.config("lua_ls", {
		capabilities = capabilities,
	})
	-- JavaScript/Typescript
	lsp.enable("ts_ls")
	lsp.config("ts_ls", {
		capabilities = capabilities,
	})
	-- CSS
	lsp.enable("cssls")
	lsp.config("cssls", {
		capabilities = capabilities,
	})
	-- Meson
	lsp.enable("mesonlsp")
	lsp.config("mesonlsp", {
		capabilities = capabilities,
	})
	-- Zig
	lsp.enable("zls")
	lsp.config("zls", {
		capabilities = capabilities,
	})
	-- Python
	lsp.enable("pyright")
	lsp.config("pyright", {
		capabilities = capabilities,
	})
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = true,
	event = { "FileType" },
}
