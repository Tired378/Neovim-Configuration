local builtin = require('telescope.builtin')
local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")
local z_utils = require("telescope._extensions.zoxide.utils")
local present, telescope = pcall(require, "telescope")

if not present then
  return
end

vim.g.theme_switcher_loaded = true

--require("base46").load_highlight "telescope"

local options = {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
        ["<C-t>"] = trouble.open_with_trouble
      },
      n = {
        ["q"] = actions.close,
        ["<C-c>"] = actions.close,
        ["<C-t>"] = trouble.open_with_trouble
      },
    },
    extensions = {
      zoxide = {
        prompt_title = "[ Zoxide List ]",
        -- Zoxide list command with score
        list_command = "zoxide query -ls",
        mappings = {
          default = {
            action = function(selection)
              vim.cmd.edit(selection.path)
            end,
            after_action = function(selection)
              print("Directory changed to " .. selection.path)
            end
          },
          ["<C-h>"] = { action = z_utils.create_basic_command("split") },
          ["<C-v>"] = { action = z_utils.create_basic_command("vsplit") },
          ["<C-e>"] = { action = z_utils.create_basic_command("edit") },
          ["<C-b>"] = {
            keepinsert = true,
            action = function(selection)
              builtin.file_browser({ cwd = selection.path })
            end
          },
          ["<C-f>"] = {
            keepinsert = true,
            action = function(selection)
              builtin.find_files({ cwd = selection.path })
            end
          },
          ["<C-t>"] = {
            action = function(selection)
              vim.cmd.tcd(selection.path)
            end
          },
        },
      },
    },
  },
}

-- check for any override
telescope.setup(options)

-- Enable telescope fzf native, if installed
pcall(telescope.load_extension, 'fzf')
-- Enable persisted plugin extension
pcall(telescope.load_extension, 'persisted')
-- Enable zoxide extension
pcall(telescope.load_extension, 'zoxide')
-- Enable noice extension
pcall(telescope.load_extension, 'noice')

-- Telescope live_grep in git root
-- Function to find the git root directory based on the current buffer's path
local function find_git_root()
  -- Use the current buffer's path as the starting point for the git search
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir
  local cwd = vim.fn.getcwd()
  -- If the buffer is not associated with a file, return nil
  if current_file == "" then
    current_dir = cwd
  else
    -- Extract the directory from the current file's path
    current_dir = vim.fn.fnamemodify(current_file, ":h")
  end

  -- Find the Git root directory from the current file's path
  local git_root = vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
  if vim.v.shell_error ~= 0 then
    print("Not a git repository. Searching on current working directory")
    return cwd
  end
  return git_root
end

-- Custom live_grep function to search in git root
local function live_grep_git_root()
  local git_root = find_git_root()
  if git_root then
    builtin.live_grep({
      search_dirs = { git_root },
    })
  end
end

vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

-- Keybind mapping
vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]earch existing [B]uffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sG', function()
  vim.cmd('LiveGrepGitRoot')
end, { desc = '[S]earch by [G]rep on Git Root' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>ss', function()
  vim.cmd('Telescope persisted')
end, { desc = '[S]earch [S]essions' })

-- Zoxide mapping
vim.keymap.set("n", "<leader>cd", telescope.extensions.zoxide.list)
