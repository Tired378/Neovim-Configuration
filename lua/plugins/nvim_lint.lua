-- No example configuration was found for this plugin.
--
-- For detailed information on configuring this plugin, please refer to its
-- official documentation:
--
--   https://github.com/mfussenegger/nvim-lint
--
-- If you wish to use this plugin, you can optionally modify and then uncomment
-- the configuration below.

return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      -- css = { "stylelint" },
      -- html = { "stylelint" },
      -- json = { "jsonlint" },
      -- yaml = { "yamllint" },
      -- markdown = { "markdownlint" },
      -- lua = { "luacheck" },
      python = { "flake8" },
      bash = { "shellcheck" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
