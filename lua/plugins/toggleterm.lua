return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		direction = "float",
		float_opts = {
			border = "rounded",
			width = function()
				return math.ceil(vim.o.columns * 0.7)
			end,
			height = function()
				return math.ceil(vim.o.lines * 0.7)
			end,
		},
		winbar = {
			enabled = true,
			name_formatter = function(term)
				return term.name
			end,
		},
	},
}
