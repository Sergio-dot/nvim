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
			mappings = {
				["O"] = function(state)
					local node = state.tree:get_node()
					local path = node:get_id()
					vim.ui.open(path)
				end,
				["g"] = function(state)
					local node = state.tree:get_node()
					local path = node:get_id()
					if node.type == "directory" then
						require("telescope.builtin").live_grep({ cwd = path })
					else
						-- if it's a file, grep in its parent directory
						require("telescope.builtin").live_grep({ cwd = vim.fn.fnamemodify(path, ":h") })
					end
				end,
			},
		},
	},
	config = function(_, opts)
		require("neo-tree").setup(opts)
	end,
}
