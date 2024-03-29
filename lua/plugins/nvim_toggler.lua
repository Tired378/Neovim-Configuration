-- No example configuration was found for this plugin.
--
-- For detailed information on configuring this plugin, please refer to its
-- official documentation:
--
--   https://github.com/nguyenvukhang/nvim-toggler
--
-- If you wish to use this plugin, you can optionally modify and then uncomment
-- the configuration below.

return {
  "nguyenvukhang/nvim-toggler",
  opts = {
    -- your own inverses
    inverses = {
      ['true'] = 'false',
      ['True'] = 'False',
      ['yes'] = 'no',
      ['Yes'] = 'No',
      ['on'] = 'off',
      ['left'] = 'right',
      ['up'] = 'down',
      ['enable'] = 'disable',
      ['!='] = '==',
    },
    -- removes the default <leader>i keymap
    remove_default_keybinds = false,
    -- removes the default set of inverses
    remove_default_inverses = false,
  }
}
