return {
	"OXY2DEV/markview.nvim",
	lazy = false, -- Recommended by the author as it handles its own lazy-loading
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("markview").setup({
			-- Default settings are robust; adding minimal config if needed in the future
		})
	end,
}
