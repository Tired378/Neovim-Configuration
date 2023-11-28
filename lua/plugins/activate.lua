return {
  "roobert/activate.nvim",
  keys = {
    {
      "<leader>P",
      '<CMD>lua require("activate").list_plugins()<CR>',
      desc = "Plugins",
    },
  },
  dependencies = {
    {
      -- Fuzzy Finder (files, lsp, etc)
      'nvim-telescope/telescope.nvim',
      branch = '0.1.x',
      dependencies = {
        'nvim-lua/plenary.nvim',
        {
          'nvim-telescope/telescope-fzf-native.nvim',
          build = 'make',
          cond = function()
            return vim.fn.executable 'make' == 1
          end,
        },
      },
    }
  }
}
