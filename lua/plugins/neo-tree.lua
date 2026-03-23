return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignored = false,
			},
			follow_current_file = {
				enabled = true,
			},
			use_libuv_file_watcher = true,
		},
		window = {
			position = "left",
			width = 30,
		},
	},
	config = function(_, opts)
		require("neo-tree").setup(opts)
	end,
}
