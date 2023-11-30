local map = vim.keymap.set

-- Easy CAPS
map('n', 'cu', 'viwU', { desc = '[U]ppercase word' })
map('n', 'cl', 'viwu', { desc = '[L]owercase word' })
-- Better half page jumping
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
-- Better tabbing
map('v', '<', '<gv')
map('v', '>', '>gv')
-- c and d no longer override the default yank/paste buffer
map('n', 'd', "\"_d")
map('v', 'd', "\"_d")
-- map('n', 'c', '"_c')
-- map('n', 'C', '"_C')
-- map('n', 's', '"_s')
-- map('n', 'S', '"_S')
-- Substitute selection without overwriting yank/paste buffer
map('x', '<leader>p', "\"_dP", { desc = 'paste no overwrite' })
-- Create a new line under/over the cursor without entering insert
map('n', '<leader>o', 'o<ESC>', { desc = 'New line under' })
map('n', '<leader>O', 'O<ESC>', { desc = 'New line over' })
-- Alternate way to save
-- map('n', '<C-s>', ':w<CR>')
map('n', '<C-s>', function() vim.cmd('w') end)
-- Alternate way to quit
map('n', '<C-q>', require "confirm-quit".confirm_quit)
-- Quits all tabs and quits nvim
map('n', '<C-a>', require "confirm-quit".confirm_quit_all)
-- Use ctrl-c instead of ESC
map('n', '<C-c>', '<ESC>')
map('i', '<C-c>', '<ESC>')
map('i', 'jj', '<ESC>')
-- TAB in general mode will move to the next text buffer
map('n', 'm', function() vim.cmd('MinimapToggle') end, { desc = 'Toggle [M]inimap' })
-- Quick opening of vertical split and moves focus on it
map('n', '<leader>v', '<C-w>v<C-w>l', { desc = 'Vertical split' })
map('n', '<leader>h', '<C-w>s<C-w>j', { desc = 'Horizontal split' })
-- Better split navigation
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
-- Faster command mode
map({ "n", "v" }, ',', ':')
-- Resizing of windows using ALT
map('n', '<M-S-k>', function() vim.cmd('resize -2') end)
map('n', '<M-S-j>', function() vim.cmd('resize +2') end)
map('n', '<M-S-l>', function() vim.cmd('vertical resize -2') end)
map('n', '<M-S-h>', function() vim.cmd('vertical resize +2') end)
-- Enable/disable spellchecking
map('n', '<leader>à', function()
    vim.cmd('set spell!')
end, { desc = 'Enable/disable spellchecking' })
-- Enable/disable highlight of search results
map('n', '<leader>ò', function()
    vim.cmd('set hlsearch!')
end, { desc = 'Enable/disable search highlight' })
-- J won't move the cursor to the end of the line
map('n', 'J', 'mzJ`z')
-- Search results always at the center of the screen
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
-- Replace every occurrence of the word under the cursor in the file
map("n", "<leader>R", [[:%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = 'Replace every occurrence of word' })
-- map("n", "<leader>R", [[:%s/word/substitute/gI<Left><Left><Left>]], { desc = 'Replace every occurrence of word' })
-- Fast sourcing of file
map("n", "<leader><leader>", function()
    vim.cmd('so')
    -- require('notify')('Sourced file')
    vim.notify('Sourced file.', "info", {
        title = "Messages",
    })
end, { desc = 'Source current file' })
-- Trouble keybinds
map("n", "<leader>tt", function() require("trouble").toggle() end,
    { desc = 'Trouble toggle' })
map("n", "<leader>tw", function() require("trouble").toggle("workspace_diagnostics") end,
    { desc = 'Trouble workspace diagnostics' })
map("n", "<leader>td", function() require("trouble").toggle("document_diagnostics") end,
    { desc = 'Trouble document diagnostics' })
map("n", "<leader>tq", function() require("trouble").toggle("quickfix") end,
    { desc = 'Trouble quickfix' })
map("n", "<leader>tl", function() require("trouble").toggle("loclist") end,
    { desc = 'Trouble loclist' })
map("n", "<leader>tr", function() require("trouble").toggle("lsp_references") end,
    { desc = 'Trouble lsp references' })
-- BarBar keybinds
-- Move to previous/next
map('n', '<TAB>', '<Cmd>BufferNext<CR>')
map('n', '<S-TAB>', '<Cmd>BufferPrevious<CR>')
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>')
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>')
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>')
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>')
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>')
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>')
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>')
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>')
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>')
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>')
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>')
map('n', '<A-0>', '<Cmd>BufferLast<CR>')
-- Pin/unpin buffer
-- map('n', '<A-p>', '<Cmd>BufferPin<CR>')
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>')
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>')
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', { desc = 'Order buffers by [B]uffer number' })
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', { desc = 'Order buffers by [D]irectory' })
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', { desc = 'Order buffers by [L]anguage' })
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', { desc = 'Order buffers by [W]indow number' })

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

-- Goto-preview keybinds
map("n", "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { desc = "[D]efinition" })
map("n", "gpt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", { desc = "[T]ype definition" })
map("n", "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", { desc = "[I]mplementation" })
map("n", "gpD", "<cmd>lua require('goto-preview').goto_preview_declaration()<CR>", { desc = "[D]eclaration" })
map("n", "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", { desc = "[R]eferences" })
map("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", { desc = "Close [P]review windows" })

-- Url-open keybind
-- map("n", "gl", "<esc>:URLOpenUnderCursor<cr>", { desc = "Open [L]ink under cursor" })
map("n", "gl", function()
    vim.cmd("URLOpenUnderCursor")
    -- I'm keeping it here for future use
    -- local handlers = require('url-open.modules.handlers')
    -- local options = require('url-open.modules.options')
    -- handlers.open_url(options.DEFAULT_OPTIONS)
end, { desc = "Open [L]ink under cursor" })

-- Nvim-toggler keybinds
map({ 'n', 'v' }, '<leader>i', require('nvim-toggler').toggle, { desc = "Toggle [I]nverse" })

-- Noice keybinds
map("n", "<leader>nl", function()
    require("noice").cmd("last")
end, { desc = "[L]ast command" })

map("n", "<leader>nh", function()
    require("noice").cmd("history")
end, { desc = "[H]istory" })

vim.keymap.set({ "n", "i", "s" }, "<c-d>", function()
    if not require("noice.lsp").scroll(4) then
        return "<c-d>"
    end
end, { silent = true, expr = true })

vim.keymap.set({ "n", "i", "s" }, "<c-u>", function()
    if not require("noice.lsp").scroll(-4) then
        return "<c-u>"
    end
end, { silent = true, expr = true })
