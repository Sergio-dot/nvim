return {
	"SmiteshP/nvim-navbuddy",
	dependencies = { "SmiteshP/nvim-navic" },
	cmd = "Navbuddy",
	keys = {
		{ "<leader>nb", "<cmd>Navbuddy<cr>", desc = "Code outline (Navbuddy)" },
	},
	opts = {
		lsp = { auto_attach = true },
		mappings = {
			["c"] = {
				callback = function(display)
					local scope = display.focus_node.scope
					local start_line = scope["start"].line
					local end_line = scope["end"].line

					if scope["end"].character == 0 and end_line > start_line then
						end_line = end_line - 1
					end

					display.state.leaving_window_for_action = true
					vim.api.nvim_set_current_win(display.for_win)
					vim.cmd(string.format("%d,%dnormal gcc", start_line, end_line))
					vim.api.nvim_set_current_win(display.mid.winid)
					display.state.leaving_window_for_action = false
				end,
				description = "Comment",
			},
		},
	},
}
