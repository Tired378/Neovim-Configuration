-- No example configuration was found for this plugin.
--
-- For detailed information on configuring this plugin, please refer to its
-- official documentation:
--
--   https://github.com/AckslD/nvim-neoclip.lua
--
-- If you wish to use this plugin, you can optionally modify and then uncomment
-- the configuration below.

local function is_whitespace(line)
  return vim.fn.match(line, [[^\s*$]]) ~= -1
end

local function all(tbl, check)
  for _, entry in ipairs(tbl) do
    if not check(entry) then
      return false
    end
  end
  return true
end

return {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    'kkharji/sqlite.lua',
    -- you'll need at least one of these
    'nvim-telescope/telescope.nvim',
  },
  opts = {
    enable_persistent_history = true,
    filter = function(data)
      return not all(data.event.regcontents, is_whitespace)
    end,
    keys = {
      telescope = {
        i = {
          select = '<cr>',
          paste = '<c-p>',
          paste_behind = '<c-k>',
          replay = '<c-r>', -- replay a macro
          delete = '<c-d>', -- delete an entry
          edit = '<c-e>',   -- edit an entry
          custom = {},
        },
        n = {
          select = '<cr>',
          paste = 'p',
          --- It is possible to map to more than one key.
          -- paste = { 'p', '<c-p>' },
          paste_behind = 'P',
          replay = 'r',
          delete = 'd',
          edit = 'e',
          custom = {},
        },
      },
    }
  }
}
