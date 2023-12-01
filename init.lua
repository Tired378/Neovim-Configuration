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

local options = {
    checker = {
        enabled = true,
        notify = true,
    },
    change_dettection = {
        notify = false,
    },
    ui = {
        border = 'rounded',
    },
}

require("config.options")
require("lazy").setup("plugins", options)
require("config.keybinds")
require("config.nvim-autopairs")
require("config.treesitter")
require("config.telescope")
require("config.completions")
require("config.lsp_config")
require("config.persisted")
require("config.lualine")
