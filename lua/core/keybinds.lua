-- Maps <leader> to <Space>
vim.g.mapleader = ' '
-- Easy CAPS
vim.keymap.set('n', 'cu', 'viwU')
vim.keymap.set('n', 'cl', 'viwu')
-- Better half page jumping
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
-- Better tabbing
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
-- c and d no longer override the default yank/paste buffer
vim.keymap.set('n', 'd', "\"_d")
vim.keymap.set('v', 'd', "\"_d")
-- vim.keymap.set('n', 'c', '"_c')
-- vim.keymap.set('n', 'C', '"_C')
-- vim.keymap.set('n', 's', '"_s')
-- vim.keymap.set('n', 'S', '"_S')
-- Substitute selection without overwriting yank/paste buffer
vim.keymap.set('x', '<leader>p', "\"_dP")
-- Create a new line under/over the cursor without entering insert
vim.keymap.set('n', '<leader>o', 'o<ESC>')
vim.keymap.set('n', '<leader>O', 'O<ESC>')
-- Alternate way to save
vim.keymap.set('n', '<C-s>', ':w<CR>')
-- Alternate way to quit
vim.keymap.set('n', '<C-q>', ':q!<CR>')
-- Quits all tabs and quits nvim
vim.keymap.set('n', '<C-a>', ':qa<CR>')
-- Use ctrl-c instead of ESC
vim.keymap.set('n', '<C-c>', '<ESC>')
vim.keymap.set('i', '<C-c>', '<ESC>')
vim.keymap.set('i', 'jj', '<ESC>')
-- TAB in general mode will move to the next text buffer
vim.keymap.set('n', '<TAB>', ':bnext<CR>')
-- SHIFT-TAB will go back
vim.keymap.set('n', '<S-TAB>', ':bprevious<CR>')
-- Quick opening of vertical split and moves focus on it
vim.keymap.set('n', '<leader>v', '<C-w>v<C-w>l')
vim.keymap.set('n', '<leader>s', '<C-w>s<C-w>j')
-- Better split navigation
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
-- Faster command mode
vim.keymap.set({"n", "v"}, ',', ':')
-- Resizing of windows using ALT
vim.keymap.set('n', '<M-S-k>', ':resize -2<CR>')
vim.keymap.set('n', '<M-S-j>', ':resize +2<CR>')
vim.keymap.set('n', '<M-S-l>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<M-S-h>', ':vertical resize +2<CR>')
-- Enable/disable spellchecking
vim.keymap.set('n', '<leader>à', ':set spell!<CR>')
-- Enable/disable highlight of search results
vim.keymap.set('n', '<leader>ò', ':set hlsearch!<CR>')
-- J won't move the cursor to the end of the line
vim.keymap.set('n', 'J', 'mzJ`z')
-- Search results always at the center of the screen
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
-- Replace every occurence of the word under the cursor in the file
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Fast sourcing of file
vim.keymap.set("n", "<leader><leader>", ':so<CR>')

