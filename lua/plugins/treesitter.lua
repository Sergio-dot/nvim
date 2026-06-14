return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")

		ts.setup({
			-- Configuration options for the new 'main' branch
			-- Parsers are installed in the standard data directory by default
		})

		-- Enable highlighting via Neovim's built-in Treesitter API
		-- This is required on the 'main' branch rewrite
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"go",
				"gowork",
				"gomod",
				"lua",
				"yaml",
				"javascript",
				"javascriptreact",
				"typescript",
				"tsx",
				"css",
				"scss",
				"html",
				"markdown",
				"markdown_inline",
				"bash",
				"sh",
			},
			callback = function()
				vim.treesitter.start()
			end,
		})

		-- Enable Treesitter-based folding
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "go", "lua", "javascript", "javascriptreact", "typescript", "tsx", "html", "css", "bash", "sh" },
			callback = function()
				vim.wo.foldmethod = "expr"
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
			end,
		})
	end,
}
