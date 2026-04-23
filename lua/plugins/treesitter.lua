return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "go", "gowork", "gomod", "lua", "yaml" },
			modules = {},
			ignore_install = {},
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			incremental_selection = {
				enable = true,
			},
			textobjects = {
				select = {
					enable = true,
				},
			},
			folding = {
				enable = true,
				enable_fold_comments = true,
			},
			playground = {
				enable = true,
			},
		})
	end,
}
