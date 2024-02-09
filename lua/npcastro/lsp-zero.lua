local lsp = require('lsp-zero').preset({})

vim.lsp.set_log_level('debug')

local lspconfig = require('lspconfig')

lspconfig.rubocop.setup({
  cmd = { os.getenv( "HOME" ) .. "/.rbenv/shims/rubocop", '--lsp' },  -- resolves collition between mason and gemfile rubocop
  root_dir = lspconfig.util.root_pattern(".git"),
})

lspconfig.sorbet.setup({
  root_dir = lspconfig.util.root_pattern(".git"),
})

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }  -- avoid undefined global vim linter error
      }
    }
  }
})

lspconfig.volar.setup{
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
}

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
  vim.keymap.set('n', '<leader>cf', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
end)

lsp.setup_servers({'eslint', 'html', 'jsonls', 'lua_ls', 'pyright', 'volar'})

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'eslint',
    'html',
    'jsonls',
    'lua_ls',
    'pyright',
    'rubocop',
    'sorbet',
    'volar',
  },
  handlers = {
    lsp.default_setup,
  }
})

vim.diagnostic.config({
  virtual_text = true,
  underline = true,
})

