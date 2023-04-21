require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls" }
})

local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach
        }
    end,
    ["lua_ls"] = function ()
        require("lspconfig").lua_ls.setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              -- workspace = {
              --   library = {
              --     [vim.fn.expand "$VIMRUNTIME/lua"] = true,
              --     [vim.fn.stdpath "config" .. "/lua"] = true,
              --   },
              -- },
            },
          }
        }
    end
}
-- require("lspconfig").lua_ls.setup {
--   on_attach = on_attach
-- }

