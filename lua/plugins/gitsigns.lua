return {
	"lewis6991/gitsigns.nvim",
	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
		},
		current_line_blame = true,
		signcolumn = true,
		numhl = false,
		linehl = false,
		watch_gitdir = {
			interval = 1000,
			follow_files = true,
		},
	},
}
