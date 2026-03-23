return {
	"folke/tokyonight.nvim",
	priority = 1000, -- load before other UI plugins
	opts = {
		style = "storm", -- or "night", "moon", "day"
		transparent = false,
		styles = {
			comments = { italic = true },
			keywords = { italic = false },
		},
	},
	config = function(_, opts)
		require("tokyonight").setup(opts)
		vim.cmd.colorscheme("tokyonight")
	end,
}
