local builtin = require("telescope.builtin")

-- Telescope
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep in files" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })

-- LSP navigation
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>gr", builtin.lsp_references)
vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions)
vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations)
vim.keymap.set("n", "<leader>gs", builtin.lsp_document_symbols)
vim.keymap.set("n", "<leader>gS", builtin.lsp_workspace_symbols)

-- neo-tree
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>")
vim.keymap.set("n", "<leader>o", "<cmd>Neotree focus<CR>")

-- windows (managed by smart-splits)
vim.keymap.set("n", "<A-h>", function() require("smart-splits").resize_left() end, { desc = "Resize left" })
vim.keymap.set("n", "<A-j>", function() require("smart-splits").resize_down() end, { desc = "Resize down" })
vim.keymap.set("n", "<A-k>", function() require("smart-splits").resize_up() end, { desc = "Resize up" })
vim.keymap.set("n", "<A-l>", function() require("smart-splits").resize_right() end, { desc = "Resize right" })
vim.keymap.set("n", "<C-h>", function() require("smart-splits").move_cursor_left() end, { desc = "Move to left split" })
vim.keymap.set("n", "<C-j>", function() require("smart-splits").move_cursor_down() end, { desc = "Move to bottom split" })
vim.keymap.set("n", "<C-k>", function() require("smart-splits").move_cursor_up() end, { desc = "Move to top split" })
vim.keymap.set("n", "<C-l>", function() require("smart-splits").move_cursor_right() end, { desc = "Move to right split" })

-- terminal
vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
vim.keymap.set("n", "<leader>tn", function()
	local ok, tt = pcall(require, "toggleterm.terminal")
	if not ok then return end
	local terminals = tt.get_all()
	local next_id = 0
	for _, term in ipairs(terminals) do
		if term.id > next_id then
			next_id = term.id
		end
	end
	vim.cmd((next_id + 1) .. "ToggleTerm")
end, { desc = "New terminal" })
vim.keymap.set("n", "<leader>ts", "<cmd>TermSelect<CR>", { desc = "Select terminal" })
vim.keymap.set("t", "<Esc>t", "<cmd>ToggleTerm<CR>")
vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]])

-- diagnostics
vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float)

-- comment
vim.keymap.set("n", "<leader>/", function()
	require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle comment" })
vim.keymap.set(
	"v",
	"<leader>/",
	"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
	{ desc = "Toggle comment" }
)

-- ux
vim.keymap.set("n", "<leader>qq", "<cmd>confirm q<CR>", { desc = "Quit current (confirm)" })
vim.keymap.set("n", "<leader>qa", "<cmd>confirm qa<CR>", { desc = "Quit all (confirm)" })
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR><Esc>")

-- format
vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format({ async = true })
end)
