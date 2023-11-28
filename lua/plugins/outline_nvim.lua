-- No example configuration was found for this plugin.
--
-- For detailed information on configuring this plugin, please refer to its
-- official documentation:
--
--   https://github.com/hedyhli/outline.nvim
--
-- If you wish to use this plugin, you can optionally modify and then uncomment
-- the configuration below.

return {
  "hedyhli/outline.nvim",
  lazy = true,
  cmd = { "Outline", "OutlineOpen" },
  keys = { -- Example mapping to toggle outline
    { "\\s", "<cmd>Outline<CR>", desc = "Toggle [S]ymbols outline" },
  },
  opts = {
    -- Your setup opts here
    outline_items = {
      show_symbol_lineno = true,
    },
    preview_window = {
      border = "rounded",
    },
    keymaps = {
      toggle_preview = "P",
    }
  },
}
