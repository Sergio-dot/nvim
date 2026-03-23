return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- capabilities (cmp integration)
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			------------------------------------------------------------------
			-- Go (gopls)
			------------------------------------------------------------------
			vim.lsp.config("gopls", {
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				root_markers = { "go.mod", "go.work", ".git" },
				capabilities = capabilities,
			})

			vim.lsp.enable("gopls")

			-- organize imports + format on save (Go only)
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*.go",
				callback = function()
					local params = vim.lsp.util.make_range_params()
					params.context = { only = { "source.organizeImports" } }

					local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)

					for _, res in pairs(result or {}) do
						for _, action in pairs(res.result or {}) do
							if action.edit then
								vim.lsp.util.apply_workspace_edit(action.edit, "utf-16")
							end
						end
					end

					vim.lsp.buf.format({ async = false })
				end,
			})

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
