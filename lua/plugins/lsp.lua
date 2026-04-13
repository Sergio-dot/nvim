return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- capabilities (cmp integration)
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			-- Breadcrumbs (navic) attachment
			local navic = require("nvim-navic")
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client and client.server_capabilities.documentSymbolProvider then
						navic.attach(client, args.buf)
					end
				end,
			})

			------------------------------------------------------------------
			-- Go (gopls)
			------------------------------------------------------------------
			vim.lsp.config("gopls", {
				capabilities = capabilities,
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							compositeLiteralTypes = true,
							constantValues = true,
							functionTypeParameters = true,
							parameterNames = true,
							rangeVariableTypes = true,
						},
					},
				},
			})

			vim.lsp.enable("gopls")

			------------------------------------------------------------------
			-- Lua (lua-language-server)
			------------------------------------------------------------------
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						format = {
							enable = true,
						},
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
					},
				},
			})

			vim.lsp.enable("lua_ls")

			-- format on save (Lua only)
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*.lua",
				callback = function()
					vim.lsp.buf.format({ async = false })
				end,
			})
			-- END
		end,
	},
}
