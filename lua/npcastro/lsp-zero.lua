local lsp = require('lsp-zero').preset({})

lsp.ensure_installed({
    'eslint',
    'html',
    'jsonls',
    'lua_ls',
    'pyright',
    -- rubocop must not be installed. Else it collides with the one on projects' gemfiles
    'solargraph',
    'tsserver',
    'volar',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

vim.lsp.set_log_level("debug")


-- local null_ls_status_ok, null_ls = pcall(require, "null-ls")
-- if not null_ls_status_ok then
--   return
-- end
--
-- local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics
--
-- null_ls.setup({
--   debug = false,
--   sources = {
--     -- javascript
--     formatting.prettier,
--     diagnostics.eslint,
--
--     -- lua
--     formatting.stylua.with({ extra_args = { "--indent-type", "Spaces", "--indent-width", 2 } }),
--
--     -- python
--     diagnostics.flake8,
--
--     -- ruby
--     formatting.rubocop,
--     diagnostics.rubocop,
--   },
-- })

local lspconfig = require('lspconfig')

lspconfig.rubocop.setup({})
-- lspconfig.solargraph.setup({})

-- local jsonls_opts = require("npcastro.lsp.settings.jsonls")
-- lspconfig["jsonls"].setup(vim.tbl_deep_extend("force", jsonls_opts, opts))


lsp.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

lsp.on_attach(function(_, bufnr)
  local opts = {buffer = bufnr, remap = false}
  lsp.default_keymaps(opts)

  vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
  underline = true,
  update_in_insert = true
})

