return {
	{
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup({
				-- Already managed in lsp.lua
				lsp_cfg = false,
				-- Run gofmt on save
				lsp_on_save = true,
				-- Organize imports on save
				lsp_on_client_save = true,
				-- Gofmt tool (can be gofumpt)
				gofmt = "gofumpt",
				-- Disable problematic codelens in nightly
				lsp_codelens = false,
				-- Inlay hints
				lsp_inlay_hints = {
					enable = true,
				},
				-- Tests configuration
				test_runner = "go", -- or 'richgo', 'delve'
			})
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()',
	},
}
