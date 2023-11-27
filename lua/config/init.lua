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
    {
        -- Theme inspired by Atom
        'navarasu/onedark.nvim',
        priority = 1000,
    },
    {
        -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
        -- See `:help lualine.txt`
        opts = {
            options = {
                icons_enabled = false,
                theme = 'onedark',
                component_separators = '|',
                section_separators = '',
            },
        },
    },
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {},
        version = '^1.7.0', -- optional: only update when a new 1.x version is released
    },
    'nvim-tree/nvim-tree.lua',
    'nvim-tree/nvim-web-devicons',
    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },
    'windwp/nvim-ts-autotag',
    'RRethy/nvim-treesitter-endwise',
    'HiPhish/rainbow-delimiters.nvim',
    'tpope/vim-sleuth',
    'github/copilot.vim',
    { 'numToStr/Comment.nvim', opts = {} },
    -- Git related plugins
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    'lewis6991/gitsigns.nvim',
    -- Keybind helper
    { 'folke/which-key.nvim',  opts = {} },
    'matze/vim-move',
    { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
    'RRethy/vim-illuminate',
    'norcalli/nvim-colorizer.lua',
    {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = {
            -- Snippet Engine & its associated nvim-cmp source
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',

            -- Adds LSP completion capabilities
            'hrsh7th/cmp-nvim-lsp',

            -- Adds a number of user-friendly snippets
            'rafamadriz/friendly-snippets',
        },
    },
    {
        -- Parenthesis autopairs
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    {
        -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            { 'j-hui/fidget.nvim', opts = {} },

            -- Additional lua configuration, makes nvim stuff amazing!
            'folke/neodev.nvim',
        },
    },
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
    },
    {
        'folke/trouble.nvim',
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
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
                        { desc = ' Lazy', group = '@property', action = 'Lazy', key = 'l' },
                        { desc = ' Mason', group = '@property', action = 'Mason', key = 'm' },
                        {
                            icon = ' ',
                            icon_hl = '@variable',
                            desc = 'Files',
                            group = 'Label',
                            action = 'Telescope find_files',
                            key = 'f',
                        },
                        {
                            desc = ' Buffers',
                            group = 'DiagnosticHint',
                            action = 'Telescope buffers',
                            key = 'a',
                        },
                        {
                            desc = ' Commands',
                            group = 'Number',
                            action = 'Telescope commands',
                            key = 'c',
                        },
                    },
                },
            }
        end,
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
}

local opts = {}

require("lazy").setup(plugins, opts)
