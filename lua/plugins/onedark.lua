return {
	"navarasu/onedark.nvim",
	name = "onedark",
	lazy = true,
	opts = {
		style = "darker", -- dark, darker, cool, deep, warm, warmer, light
		transparent = false,
		term_colors = true,
		ending_tildes = false,
		cmp_itemkind_reverse = false,
		code_style = {
			comments = "italic",
			keywords = "none",
			functions = "none",
			strings = "none",
			variables = "none",
		},
		lualine = {
			transparent = false, -- lualine center bar transparency
		},
		diagnostics = {
			darker = true, -- darker colors for diagnostic
			undercurl = true, -- use undercurl instead of underline for diagnostics
			background = true, -- use background color for virtual text
		},
	},
}
