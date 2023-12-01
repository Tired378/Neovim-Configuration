-- No example configuration was found for this plugin.
--
-- For detailed information on configuring this plugin, please refer to its
-- official documentation:
--
--   https://github.com/Eandrju/cellular-automaton.nvim
--
-- If you wish to use this plugin, you can optionally modify and then uncomment
-- the configuration below.

return {
  "Eandrju/cellular-automaton.nvim",
  keys = {
    { '<leader>fmr', '<cmd>CellularAutomaton make_it_rain<cr>', desc = 'Make it rain' },
    { '<leader>fml', '<cmd>CellularAutomaton game_of_life<cr>', desc = 'Game of life' },
  }
}

