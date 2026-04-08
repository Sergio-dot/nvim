return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			themes = {
				{
					name = "Tokyo Night",
					colorscheme = "tokyonight",
				},
				{
					name = "Tokyo Night Moon",
					colorscheme = "tokyonight-moon",
				},
				{
					name = "Tokyo Night Storm",
					colorscheme = "tokyonight-storm",
				},
				{
					name = "Tokyo Night Night",
					colorscheme = "tokyonight-night",
				},
				{
					name = "Tokyo Night Day",
					colorscheme = "tokyonight-day",
				},
				{
					name = "Catppuccin Mocha",
					colorscheme = "catppuccin-mocha",
				},
				{
					name = "Catppuccin Macchiato",
					colorscheme = "catppuccin-macchiato",
				},
				{
					name = "Catppuccin Frappe",
					colorscheme = "catppuccin-frappe",
				},
				{
					name = "Catppuccin Latte",
					colorscheme = "catppuccin-latte",
				},
				{
					name = "Kanagawa Wave",
					colorscheme = "kanagawa-wave",
				},
				{
					name = "Kanagawa Dragon",
					colorscheme = "kanagawa-dragon",
				},
				{
					name = "Kanagawa Lotus",
					colorscheme = "kanagawa-lotus",
				},
				{
					name = "Rose Pine",
					colorscheme = "rose-pine",
				},
				{
					name = "Rose Pine Moon",
					colorscheme = "rose-pine-moon",
				},
				{
					name = "Rose Pine Dawn",
					colorscheme = "rose-pine-dawn",
				},
				{
					name = "Gruvbox Dark",
					colorscheme = "gruvbox",
					before = [[ vim.opt.background = "dark" ]],
				},
				{
					name = "Gruvbox Light",
					colorscheme = "gruvbox",
					before = [[ vim.opt.background = "light" ]],
				},
				{
					name = "Nightfox",
					colorscheme = "nightfox",
				},
				{
					name = "Duskfox",
					colorscheme = "duskfox",
				},
				{
					name = "Nordfox",
					colorscheme = "nordfox",
				},
				{
					name = "Terafox",
					colorscheme = "terafox",
				},
				{
					name = "One Dark",
					colorscheme = "onedark",
				},
			},
			livePreview = true,
		})
	end,
}
