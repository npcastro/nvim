local status_ok, lspconfig = pcall(require, "lspconfig")

if not status_ok then
  return
end

local opts = {
  on_attach = require("npcastro.lsp.handlers").on_attach,
  capabilities = require("npcastro.lsp.handlers").capabilities,
}
local jsonls_opts = require("npcastro.lsp.settings.jsonls")
local lua_ls_opts = require("npcastro.lsp.settings.lua_ls")
local tsserver_opts = require("npcastro.lsp.settings.tsserver")

lspconfig["eslint"].setup(opts)
lspconfig["html"].setup(opts)
lspconfig["jsonls"].setup(vim.tbl_deep_extend("force", jsonls_opts, opts))
lspconfig["pyright"].setup(opts)
lspconfig["solargraph"].setup(opts)
lspconfig["lua_ls"].setup(vim.tbl_deep_extend("force", lua_ls_opts, opts))
lspconfig["tsserver"].setup(vim.tbl_deep_extend("force", tsserver_opts, opts))
lspconfig["volar"].setup(opts)
