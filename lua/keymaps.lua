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

-- windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- terminal
vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>")
vim.keymap.set("t", "<Esc>t", "<cmd>ToggleTerm<CR>")
vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]])

-- diagnostics
vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float)

-- ux
vim.keymap.set("n", "<leader>qq", "<cmd>confirm q<CR>", { desc = "Quit current (confirm)" })
vim.keymap.set("n", "<leader>qa", "<cmd>confirm qa<CR>", { desc = "Quit all (confirm)" })
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR><Esc>")

-- format
vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format({ async = true })
end)
