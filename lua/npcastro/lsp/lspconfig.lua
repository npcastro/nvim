local status_ok, lspconfig = pcall(require, "lspconfig")

if not status_ok then
  return
end

local opts = {
  on_attach = require("npcastro.lsp.handlers").on_attach,
  capabilities = require("npcastro.lsp.handlers").capabilities,
}
local jsonls_opts = require("npcastro.lsp.settings.jsonls")
local sumneko_opts = require("npcastro.lsp.settings.sumneko_lua")

lspconfig["eslint"].setup(opts)
lspconfig["html"].setup(opts)
lspconfig["jsonls"].setup(vim.tbl_deep_extend("force", jsonls_opts, opts))
lspconfig["solargraph"].setup(opts)
lspconfig["sumneko_lua"].setup(vim.tbl_deep_extend("force", sumneko_opts, opts))
lspconfig["tsserver"].setup(opts)
lspconfig["volar"].setup(opts)
