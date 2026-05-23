-- Dynamic Command Line Height (The "Push Up" effect)
local cmdheight_group = vim.api.nvim_create_augroup("CmdlineHeight", { clear = true })
vim.api.nvim_create_autocmd("CmdlineEnter", {
	group = cmdheight_group,
	callback = function()
		vim.opt.cmdheight = 1
	end,
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
	group = cmdheight_group,
	callback = function()
		vim.opt.cmdheight = 0
	end,
})

-- Handle window resizing better
vim.api.nvim_create_autocmd("VimResized", {
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})
