-- No example configuration was found for this plugin.
--
-- For detailed information on configuring this plugin, please refer to its
-- official documentation:
--
--   https://github.com/nvim-neo-tree/neo-tree.nvim
--
-- If you wish to use this plugin, you can optionally modify and then uncomment
-- the configuration below.

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  keys = {
    { '<c-n>', '<cmd>Neotree toggle<cr>',            desc = 'Toggle [N]eotree' },
    { '\\b',   '<cmd>Neotree buffers toggle<cr>',    desc = 'Neotree [B]uffers' },
    { '\\g',   '<cmd>Neotree git_status toggle<cr>', desc = 'Neotree [G]it status' },
  },
  opts = {
    sources = {
      "filesystem",
      "buffers",
      "git_status",
      "document_symbols",
    },
    source_selector = {
      winbar = true,
      statusline = false
    },
    window = {
      mappings = {
        -- disable `nowait` if you have existing combos starting with this char that you want to use
        ["<space>"] = { "toggle_node", nowait = true, },
        ["<TAB>"] = "open",
      }
    }
  }
}
