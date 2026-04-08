return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = true,
	opts = {
		flavour = "mocha", -- latte, frappe, macchiato, mocha
		transparent_background = false,
		term_colors = true,
		integrations = {
			cmp = true,
			gitsigns = true,
			nvimtree = true,
			treesitter = true,
			notify = false,
			mini = {
				enabled = true,
				indentscope_color = "",
			},
		},
	},
}
