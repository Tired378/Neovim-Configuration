require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "javascript", "typescript", "c", "cpp", "lua", "python", "bash" },
    -- Install parsers synchronously (only applyed to 'ensure_installed')
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
