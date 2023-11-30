-- No example configuration was found for this plugin.
--
-- For detailed information on configuring this plugin, please refer to its
-- official documentation:
--
--   https://github.com/olimorris/persisted.nvim
--
-- If you wish to use this plugin, you can optionally modify and then uncomment
-- the configuration below.

return {
  "olimorris/persisted.nvim",
  priority = 100,
  opts = {
    use_git_branch = true,
    autoload = true,
    on_autoload_no_session = function()
      vim.notify("No existing session to load.")
    end,
    ignored_dirs = {
      { "~/",   exact = true },
      { "/",    exact = true },
      { "/tmp", exact = true }
    },
    should_autosave = function()
      -- do not autosave if the alpha dashboard is the current filetype
      if vim.bo.filetype == "dashboard" then
        return false
      end
      return true
    end,
  }
}
