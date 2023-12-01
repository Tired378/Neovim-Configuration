-- No example configuration was found for this plugin.
--
-- For detailed information on configuring this plugin, please refer to its
-- official documentation:
--
--   https://github.com/dstein64/nvim-scrollview
--
-- If you wish to use this plugin, you can optionally modify and then uncomment
-- the configuration below.

return {
  "dstein64/nvim-scrollview",
  opts = {
    excluded_filetypes = { 'neo-tree', 'neo-tree-popup', 'notify', 'neo-tree-preview',
      'OUTLINE_1', 'dashboard' },
    current_only = true,
    signs_on_startup = { 'conflicts', 'diagnostics', 'search', 'quickfix' },
  }
}
