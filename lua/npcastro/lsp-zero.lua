local lsp = require('lsp-zero').preset({})

vim.lsp.set_log_level('WARN')

local lspconfig = require('lspconfig')

lspconfig.rubocop.setup({
  filetypes = { "ruby", "rbi" },
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
    'tsserver',
    'volar',
  },
  handlers = {
    lsp.default_setup,
  }
})

local vue_typescript_plugin = require('mason-registry')
  .get_package('vue-language-server')
  :get_install_path()
  .. '/node_modules/@vue/language-server'
  .. '/node_modules/@vue/typescript-plugin'

lspconfig.tsserver.setup({
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vue_typescript_plugin,
        languages = {'javascript', 'typescript', 'vue'}
      },
    }
  },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
})

lspconfig.volar.setup({})

vim.diagnostic.config({
  virtual_text = true,
  underline = true,
})

