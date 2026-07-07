return {
	{
		"williamboman/mason.nvim",
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				"gopls",
				"lua_ls",
				"vtsls",
				"eslint",
				"emmet_language_server",
				"tailwindcss",
				"bashls",
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				"prettier",
				"shfmt",
				"shellcheck",
				"goimports",
				"gofumpt",
			},
		},
	},
}
