return {
	{
		"romus204/go-tagger.nvim",
		config = function()
			require("go-tagger").setup({
				skip_private = true, -- Skip unexported fields (starting with lowercase)
				casing = "camelCase", -- Global casing setting
				tags = { -- Per tag setting override
					json = {
						casing = "camelCase", -- json tags should use camelCase
					},
					xml = {
						casing = "snake_case", -- xml tags should use snake_case
					},
				},
			})
		end,
	},
}
