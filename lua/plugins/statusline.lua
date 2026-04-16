return {
	-- Statusline (The Bottom Bar)
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = "auto", -- Matches your github-dark theme
				icons_enabled = true,
				component_separators = "",
				section_separators = "",
				globalstatus = true,
			},
			sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{
						"mode",
						fmt = function(str)
							return "● " .. str
						end,
						color = { gui = "bold" },
					},
					{ "branch", icon = "" },
					{
						"filename",
						file_status = true,
						path = 1,
						color = { gui = "bold" },
					},
				},
				lualine_x = {
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = "󰅚 ", warn = "󰀪 ", info = "󰋽 ", hint = "󰌶 " },
					},
					"filetype",
					"progress",
					"location",
				},
				lualine_y = {},
				lualine_z = {},
			},
		},
	},

	-- Winbar (The "Breadcrumbs" at the top - Very IntelliJ)
	-- {
	-- 	"utilyre/barbecue.nvim",
	-- 	name = "barbecue",
	-- 	version = "*",
	-- 	dependencies = {
	-- 		"SmiteshP/nvim-navic",
	-- 		"nvim-tree/nvim-web-devicons", -- optional dependency
	-- 	},
	-- 	opts = {
	-- 		-- configurations go here
	-- 		show_modified = true,
	-- 		exclude_filetypes = { "netrw", "toggleterm", "neo-tree", "snacks_win", "Gemini", "snacks_notif" },
	-- 	},
	-- },
}
