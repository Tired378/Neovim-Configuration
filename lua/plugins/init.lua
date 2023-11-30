return {
    'nvim-lualine/lualine.nvim',
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {},
        version = '^1.7.0', -- optional: only update when a new 1.x version is released
    },
    'wfxr/minimap.vim',
    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            'nvim-treesitter/nvim-treesitter-context',
        },
        build = ':TSUpdate',
    },
    'windwp/nvim-ts-autotag',
    'RRethy/nvim-treesitter-endwise',
    'HiPhish/rainbow-delimiters.nvim',
    'tpope/vim-sleuth',
    -- 'github/copilot.vim',
    { 'numToStr/Comment.nvim', opts = {} },
    -- Git related plugins
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    -- Keybind helper
    { 'folke/which-key.nvim',  opts = {} },
    'matze/vim-move',
    { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
    'RRethy/vim-illuminate',
    { 'norcalli/nvim-colorizer.lua',         opts = {} },
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

            -- Better comparison for completion items
            'lukas-reineke/cmp-under-comparator',
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
    'onsails/lspkind.nvim',
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
                buffer_name = 'Dashboard',
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
                        {
                            desc = ' Load Dir Session',
                            group = 'Number',
                            action = 'SessionLoad',
                            key = 's',
                        },
                    },
                },
            }
        end,
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
}
