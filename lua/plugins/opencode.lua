return {
	"NickvanDyke/opencode.nvim",

	dependencies = {
		-- optional, remove if you don't want it
		"folke/snacks.nvim",
	},

	config = function()
		vim.g.opencode_opts = {
			auto_reload = true,

			server = {
				cmd = { "opencode", "--port", "4096" },
			},
		}

		-- required if auto_reload=true
		vim.o.autoread = true

		vim.keymap.set({ "n", "x" }, "<leader>oa", function()
			require("opencode").ask("@this: ", { submit = true })
		end, { desc = "Ask OpenCode" })

		vim.keymap.set("n", "<leader>os", function()
			require("opencode").select()
		end, { desc = "OpenCode actions" })
	end,
}
