return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"SmiteshP/nvim-navic",
			"b0o/SchemaStore.nvim",
		},
		config = function()
			-- capabilities (cmp integration)
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			-- Breadcrumbs (navic) attachment
			local navic_ok, navic = pcall(require, "nvim-navic")
			if navic_ok then
				vim.api.nvim_create_autocmd("LspAttach", {
					callback = function(args)
						local client = vim.lsp.get_client_by_id(args.data.client_id)
						if client and client.server_capabilities.documentSymbolProvider then
							navic.attach(client, args.buf)
						end
					end,
				})
			end

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
							assignVariableTypes = false,
							compositeLiteralFields = false,
							compositeLiteralTypes = false,
							constantValues = false,
							functionTypeParameters = false,
							parameterNames = false,
							rangeVariableTypes = false,
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

			------------------------------------------------------------------
			-- YAML (yamlls)
			------------------------------------------------------------------
			vim.lsp.config("yamlls", {
				capabilities = capabilities,
				settings = {
					yaml = {
						schemaStore = {
							-- You must disable built-in schemaStore support if you want to use
							-- schemaStore.nvim and its advanced features
							enable = false,
							-- Avoid TypeError: Cannot read property 'url' of undefined
							url = "",
						},
						schemas = require("schemastore").yaml.schemas(),
					},
				},
			})

			vim.lsp.enable("yamlls")

			------------------------------------------------------------------
			-- TypeScript/JavaScript (vtsls)
			------------------------------------------------------------------
			vim.lsp.config("vtsls", {
				capabilities = capabilities,
				settings = {
					typescript = {
						updateImportsOnFileMove = { enabled = "always" },
						suggest = {
							completeFunctionCalls = false,
						},
						preferences = {
							jsxAttributeCompletionStyle = "auto",
							includePackageJsonAutoImports = "always",
						},
						inlayHints = {
							parameterNames = { enabled = "literals" },
							parameterTypes = { enabled = true },
							variableTypes = { enabled = true },
							propertyDeclarationTypes = { enabled = true },
							functionLikeReturnTypes = { enabled = true },
							enumMemberValues = { enabled = true },
						},
					},
				},
			})

			vim.lsp.enable("vtsls")

			------------------------------------------------------------------
			-- ESLint (eslint)
			------------------------------------------------------------------
			vim.lsp.config("eslint", {
				capabilities = capabilities,
				settings = {
					workingDirectories = { mode = "auto" },
				},
			})

			vim.lsp.enable("eslint")

			------------------------------------------------------------------
			-- Emmet (emmet_language_server)
			------------------------------------------------------------------
			vim.lsp.config("emmet_language_server", {
				capabilities = capabilities,
				filetypes = {
					"css",
					"eruby",
					"html",
					"javascript",
					"javascriptreact",
					"less",
					"sass",
					"scss",
					"pug",
					"typescriptreact",
				},
			})

			vim.lsp.enable("emmet_language_server")

			------------------------------------------------------------------
			-- Tailwind CSS (tailwindcss)
			------------------------------------------------------------------
			vim.lsp.config("tailwindcss", {
				capabilities = capabilities,
				filetypes = {
					"aspnetcorerazor",
					"astro",
					"astro-markdown",
					"blade",
					"clojure",
					"django-html",
					"htmldjango",
					"edge",
					"eelixir",
					"elixir",
					"ejs",
					"erb",
					"handlebars",
					"hbs",
					"hipe",
					"html",
					"html-eex",
					"heex",
					"jade",
					"leaf",
					"liquid",
					"markdown",
					"mdx",
					"mustache",
					"njk",
					"nunjucks",
					"php",
					"razor",
					"slim",
					"twig",
					"css",
					"less",
					"postcss",
					"sass",
					"scss",
					"stylus",
					"sugarss",
					"javascript",
					"javascriptreact",
					"reason",
					"rescript",
					"typescript",
					"typescriptreact",
					"vue",
					"svelte",
				},
			})

			vim.lsp.enable("tailwindcss")

			-- format + organize imports on save (Go only)
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*.go",
				callback = function()
					-- Organize imports
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
					-- Format
					vim.lsp.buf.format({ async = false })
				end,
			})

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
