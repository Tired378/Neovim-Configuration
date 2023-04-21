local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    'navarasu/onedark.nvim',
    'nvim-tree/nvim-tree.lua',
    'nvim-tree/nvim-web-devicons',
    'nvim-treesitter/nvim-treesitter',
    'vim-airline/vim-airline',
    -- use 'terrortylor/nvim-comment'
    'numToStr/Comment.nvim',
    'matze/vim-move',
    'lukas-reineke/indent-blankline.nvim',
    'RRethy/vim-illuminate',
    'norcalli/nvim-colorizer.lua',
    -- completion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',
    'j-hui/fidget.nvim',
    {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
    },
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.1',
        dependencies = {{'nvim-lua/plenary.nvim'}}
    },
    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
        require('dashboard').setup {
            -- config
            theme = 'hyper',
            config = {
            week_header = {
            enable = true,
            },
            shortcut = {
                { desc = ' Update', group = '@property', action = 'Lazy update', key = 'u' },
                {
                icon = ' ',
                icon_hl = '@variable',
                desc = 'Files',
                group = 'Label',
                action = 'Telescope find_files',
                key = 'f',
                },
                {
                desc = ' Apps',
                group = 'DiagnosticHint',
                action = 'Telescope app',
                key = 'a',
                },
                {
                desc = ' dotfiles',
                group = 'Number',
                action = 'Telescope dotfiles',
                key = 'd',
                },
            },
            },
        }
        end,
        dependencies = {'nvim-tree/nvim-web-devicons'}
    }
}

local opts = {}

require("lazy").setup(plugins, opts)
