return {
	"lewis6991/gitsigns.nvim",
	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
		},
		current_line_blame = true,

		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "right_align",
			delay = 300,
		},

		current_line_blame_formatter = "<author> • <author_time:%R> • <abbrev_sha>",

		signcolumn = true,
		numhl = false,
		linehl = false,

		watch_gitdir = {
			interval = 1000,
			follow_files = true,
		},

		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map("n", "]c", function()
				if vim.wo.diff then
					return "]c"
				end
				vim.schedule(function()
					gs.next_hunk()
				end)
				return "<Ignore>"
			end, { expr = true, desc = "Next hunk" })

			map("n", "[c", function()
				if vim.wo.diff then
					return "[c"
				end
				vim.schedule(function()
					gs.prev_hunk()
				end)
				return "<Ignore>"
			end, { expr = true, desc = "Prev hunk" })

			-- Actions
			map("n", "<leader>ghp", gs.preview_hunk, { desc = "Git: Preview hunk" })
			map("n", "<leader>ghr", gs.reset_hunk, { desc = "Git: Reset hunk" })
			map("n", "<leader>gd", gs.diffthis, { desc = "Git: Diff this file" })

			map("n", "<leader>gD", function()
				gs.diffthis("~")
			end, { desc = "Git: Diff this file (against HEAD~1)" })
		end,
	},
}
