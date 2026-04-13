local M = {}

---Grep in a specific directory selected via a picker
M.live_grep_dir = function()
	local builtin = require("telescope.builtin")
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	builtin.find_files({
		prompt_title = "Select Directory for Grep",
		find_command = { "fd", "--type", "d", "--hidden", "--exclude", ".git" },
		attach_mappings = function(prompt_bufnr, _)
			actions.select_default:replace(function()
				local selection = action_state.get_selected_entry()
				actions.close(prompt_bufnr)
				local dir = selection.path or selection[1] or selection.value
				builtin.live_grep({
					cwd = dir,
					prompt_title = "Grep in " .. dir,
				})
			end)
			return true
		end,
	})
end

return M
