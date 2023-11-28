local group = vim.api.nvim_create_augroup("PersistedHooks", {})

vim.api.nvim_create_autocmd({ "User" }, {
  pattern = "PersistedSavePre",
  group = group,
  callback = function()
    -- Closes minimap, tree and outline buffers before saving the session
    pcall(vim.cmd, "bw -MINIMAP-")
    pcall(vim.cmd, "bw neo-tree")
    pcall(vim.cmd, "bw OUTLINE_1")
  end,
})

vim.api.nvim_create_autocmd({ "User" }, {
  pattern = "PersistedTelescopeLoadPre",
  group = group,
  callback = function(curr_session)
    -- If the current buffer is empty, load the session in a new tab
    -- Save the currently loaded session
    require("persisted").save({ curr_session = vim.g.persisted_loaded_session })
    -- Delete all of the open buffers
    vim.api.nvim_input("<ESC>:%bd!<CR>")
  end,
})
