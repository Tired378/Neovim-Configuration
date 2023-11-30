vim.opt.autoread = true
vim.opt.autowrite = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.backspace = '3'
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'both'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmatch = true
vim.opt.wildmode = 'longest,list'
vim.opt.cc = '80'
vim.opt.wrap = false

vim.opt.tabstop = 4
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.showtabline = 2
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true

vim.opt.clipboard = 'unnamedplus'
vim.opt.spell = false
--vim.opt.spelllang = 'en_US, it'

vim.opt.termguicolors = true

vim.opt.pumblend = 30
vim.opt.pumheight = 10
vim.opt.cmdheight = 0
vim.opt.iskeyword = vim.opt.iskeyword + '-'

vim.opt.confirm = true

vim.opt.splitbelow = true
vim.opt.splitright = true
-- Required by COC
-- vim.opt.backup = false
-- vim.opt.writebackup = false
vim.opt.formatoptions = vim.opt.formatoptions - 'cro'
vim.opt.updatetime = 50
-- vim.opt.timeoutlen = 1000
--
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Maps <leader> to <Space>
vim.g.mapleader = ' '
