-- No example configuration was found for this plugin.
--
-- For detailed information on configuring this plugin, please refer to its
-- official documentation:
--
--   https://github.com/bgaillard/readonly.nvim
--
-- If you wish to use this plugin, you can optionally modify and then uncomment
-- the configuration below.

return {
  "bgaillard/readonly.nvim",
  dependencies = {
    "rcarriga/nvim-notify"
  },
  opts = {
    -- see https://neovim.io/doc/user/lua.html#vim.fs.normalize()
    secured_files = {
      -- use 'nvim -u NONE myfile' to edit the file
      "~/%.aws/config",
      "~/%.aws/credentials",
      "~/%.ssh/.",
      "~/%.secrets.yaml",
      "~/%.vault-crypt-files/.",
      "~/%.env",
    }
  },
  lazy = false
}
