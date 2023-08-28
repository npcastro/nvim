local lsp = require('lsp-zero').preset({})

lsp.ensure_installed({
    'eslint',
    'html',
    'jsonls',
    'lua_ls',
    'pyright',
    -- rubocop must not be installed. Else it collides with the one on projects' gemfiles
    'tsserver',
    'volar',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

vim.lsp.set_log_level("debug")

local lspconfig = require('lspconfig')

lspconfig.rubocop.setup({})

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

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
  underline = true,
  update_in_insert = true
})

