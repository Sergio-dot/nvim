local function refresh_git()
  vim.schedule(function()
    -- Refresh Gitsigns (signs in the gutter)
    local ok_gs, gitsigns = pcall(require, "gitsigns")
    if ok_gs and type(gitsigns.refresh) == "function" then
      gitsigns.refresh()
    end

    -- Refresh Neo-tree (colors and icons in the file tree)
    local ok_event, event = pcall(require, "neo-tree.events")
    if ok_event then
      event.fire_event("git_status_changed")
    end

    local ok_mgr, manager = pcall(require, "neo-tree.sources.manager")
    if ok_mgr then
      for _, source in ipairs({ "filesystem", "buffers", "git_status" }) do
        local state = manager.get_state(source)
        if state then
          local ok_src, src = pcall(require, "neo-tree.sources." .. source)
          if ok_src and type(src.refresh) == "function" then
            src.refresh(state)
          end
        end
      end
    end
  end)
end

-- Refresh on git-related plugin events
vim.api.nvim_create_autocmd("User", {
  pattern = "FugitiveChanged",
  callback = refresh_git,
})

-- Refresh when returning to Neovim or switching buffers
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "VimResume" }, {
  callback = function()
    if vim.bo.buftype == "" then
      vim.cmd("checktime")
      refresh_git()
    end
  end,
})
