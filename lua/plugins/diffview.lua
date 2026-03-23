return {
	"sindrets/diffview.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader>dvh", "<cmd>DiffviewOpen<cr>", desc = "Open diff view" },
		{ "<leader>dvfh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },
		{ "<leader>dvrh", "<cmd>DiffviewFileHistory<cr>", desc = "Repo history" },
	},
}
