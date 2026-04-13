return {
	{
		"projekt0n/github-nvim-theme",
		lazy = false,
		priority = 1000,
		config = function()
			require("github-theme").setup({
				options = {
					transparent = false,
					styles = {
						comments = "italic",
						keywords = "bold",
						functions = "italic",
					},
				},
			})
			vim.cmd("colorscheme github_dark_dimmed")
		end,
	},
}
