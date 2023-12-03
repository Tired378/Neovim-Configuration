-- No example configuration was found for this plugin.
--
-- For detailed information on configuring this plugin, please refer to its
-- official documentation:
--
--   https://github.com/kylechui/nvim-surround
--
-- If you wish to use this plugin, you can optionally modify and then uncomment
-- the configuration below.

-- Core operations: add (ys{motion}{char}), delete (ds{char}), change (cs{target}{replacement})
return {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      -- Configuration here, or leave empty to use defaults
    })
  end,
}
