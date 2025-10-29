local lspconfig = require('lspconfig')
local lspconfig_defaults = lspconfig.util.default_config

lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- vim.lsp.set_log_level('WARN')
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.keymap.set('n', '<leader>cf', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
  end,
})

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '✘',
      [vim.diagnostic.severity.WARN] = '▲',
      [vim.diagnostic.severity.HINT] = '⚑',
      [vim.diagnostic.severity.INFO] = '»',
    },
  },
})

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
    'ts_ls',
    'volar',
  },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
    sorbet = function()
      lspconfig.sorbet.setup({
        cmd = { "srb", "tc", "--lsp", "--disable-watchman" },
        root_dir = lspconfig.util.root_pattern(".git"),
        flags = {
          debounce_text_changes = 500,
        },
      })
    end,
    rubocop = function()
      lspconfig.rubocop.setup({
        filetypes = { "ruby", "rbi" },
        cmd = { "bundle", "exec", "rubocop", "--lsp"}, -- use rubocop installed through Gemfile
        root_dir = lspconfig.util.root_pattern('.git', 'Gemfile.lock'),
        flags = {
          debounce_text_changes = 300,
        },
      })
    end,
    lua_ls = function()
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }  -- avoid undefined global vim linter error
            }
          }
        }
      })
    end,
    ts_ls = function()
      local vue_typescript_plugin = require('mason-registry')
      .get_package('vue-language-server')
      :get_install_path()
      .. '/node_modules/@vue/language-server'
      .. '/node_modules/@vue/typescript-plugin'

      lspconfig.ts_ls.setup({
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
    end
  }
})

vim.diagnostic.config({
  virtual_text = true,
  underline = true
})
