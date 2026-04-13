return {
	-- Statusline (The Bottom Bar)
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = "auto", -- Automatically matches your github-dark theme
				icons_enabled = true,
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					{ "mode", fmt = function(str) return str:sub(1, 1) end }, -- Minimal mode (N, I, V)
				},
				lualine_b = { "branch", "diff" },
				lualine_c = {
					{
						"filename",
						file_status = true,
						path = 1, -- Show relative path
					},
				},
				lualine_x = {
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = "󰅚 ", warn = "󰀪 ", info = "󰋽 ", hint = "󰌶 " },
					},
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		},
	},

	-- Winbar (The "Breadcrumbs" at the top - Very IntelliJ)
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		opts = {
			-- configurations go here
			show_modified = true,
		},
	},
}
