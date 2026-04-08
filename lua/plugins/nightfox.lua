return {
	"EdenEast/nightfox.nvim",
	name = "nightfox",
	lazy = true,
	opts = {
		options = {
			transparent = false, -- disable setting background
			terminal_colors = true, -- define vim.g.terminal_color_{0..15}
			styles = { -- style to be applied to different syntax groups
				comments = "NONE", -- value can be "italic", "bold", "underline", "NONE"
				conditionals = "NONE",
				constants = "NONE",
				functions = "NONE",
				keywords = "NONE",
				numbers = "NONE",
				operators = "NONE",
				strings = "NONE",
				types = "NONE",
				variables = "NONE",
			},
			inverse = { -- inverse highlight for different types
				match_paren = false,
				visual = false,
				search = false,
			},
		},
	},
}
