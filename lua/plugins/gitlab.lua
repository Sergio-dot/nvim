return {
  "harrisoncramer/gitlab.nvim",
  dependencies = { "sindrets/diffview.nvim", "nvim-lua/plenary.nvim" },
  keys = { "gl" },
  config = function()
    require("gitlab").setup({})

    -- Override jump_to_file to open in the current tab instead of a new tab
    local common = require("gitlab.actions.common")
    local indicators_common = require("gitlab.indicators.common")

    local function get_new_line(node)
      local range = node.range
      if range == nil then
        return node.new_line
      end
      local _, new_start_line = indicators_common.parse_line_code(range.start.line_code)
      return new_start_line
    end

    local function get_old_line(node)
      local range = node.range
      if range == nil then
        return node.old_line
      end
      local old_start_line, _ = indicators_common.parse_line_code(range.start.line_code)
      return old_start_line
    end

    local function get_root_node(tree, node)
      if not node then
        return nil
      end
      if node.type == "note_body" or node.type == "note" and not node.is_root then
        local parent_id = node:get_parent_id()
        return get_root_node(tree, tree:get_node(parent_id))
      elseif node.is_root then
        return node
      end
    end

    common.jump_to_file = function(tree)
      local node = tree:get_node()
      local root_node = get_root_node(tree, node)
      if root_node == nil then
        vim.notify("Could not get discussion node", vim.log.levels.ERROR)
        return
      end
      if root_node.file_name == nil then
        vim.notify("This comment was not left on a particular location", vim.log.levels.WARN)
        return
      end
      if vim.fn.filereadable(root_node.file_name) == 0 then
        vim.notify(
          string.format("The file %s for which the comment was made doesn't exist in HEAD.", root_node.file_name),
          vim.log.levels.WARN
        )
        return
      end

      local line_number = get_new_line(root_node) or get_old_line(root_node)
      if line_number == nil or line_number == 0 then
        line_number = 1
      end

      -- Open in a non-special window in the current tab instead of a new tab
      local opened = false
      for _, win_id in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        local buf = vim.api.nvim_win_get_buf(win_id)
        local bt = vim.api.nvim_buf_get_option(buf, "buftype")
        if bt == "" and vim.api.nvim_win_is_valid(win_id) then
          vim.api.nvim_set_current_win(win_id)
          opened = true
          break
        end
      end
      if not opened then
        vim.cmd.tabnew()
      end

      local bufnr = vim.fn.bufnr(root_node.file_name)
      if bufnr ~= -1 then
        vim.cmd("buffer " .. bufnr)
        vim.api.nvim_win_set_cursor(0, { line_number, 0 })
        return
      end

      vim.cmd("edit " .. root_node.file_name)
      vim.api.nvim_win_set_cursor(0, { line_number, 0 })
    end
  end,
}
