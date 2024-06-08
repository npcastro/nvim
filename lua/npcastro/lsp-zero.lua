local lsp = require('lsp-zero').preset({})

vim.lsp.set_log_level('WARN')

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

local util = require 'lspconfig.util'
local function get_typescript_server_path(root_dir)

  local global_ts = '/Users/npcastro/.nvm/versions/node/v16.13.1/lib/node_modules/typescript/lib'
  -- Alternative location if installed as root:
  -- local global_ts = '/usr/local/lib/node_modules/typescript/lib'
  local found_ts = ''
  local function check_dir(path)
    found_ts =  util.path.join(path, 'node_modules', 'typescript', 'lib')
    if util.path.exists(found_ts) then
      return path
    end
  end
  if util.search_ancestors(root_dir, check_dir) then
    return found_ts
  else
    return global_ts
  end
end

lspconfig.volar.setup{
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
  on_new_config = function(new_config, new_root_dir)
    new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
  end,
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

