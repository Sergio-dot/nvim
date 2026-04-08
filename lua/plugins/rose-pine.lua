return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = true,
	opts = {
		variant = "auto", -- auto, main, moon, or dawn
		dark_variant = "main", -- main, moon, or dawn
		dim_inactive_windows = false,
		extend_background_behind_borders = true,
		enable = {
			terminal = true,
			legacy_highlights = true, -- if you use plugins that don't yet support nvim-hl
			migrations = true, -- handle deprecated options automatically
		},
		styles = {
			italic = true,
			bold = false,
			transparency = false,
		},
	},
}
