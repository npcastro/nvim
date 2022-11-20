local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  debug = false,
  sources = {
    -- javascript
    formatting.prettier,
    diagnostics.eslint,

    -- lua
    formatting.stylua.with({ extra_args = { "--indent-type", "Spaces", "--indent-width", 2 } }),

    -- python
    diagnostics.flake8,

    -- ruby
    formatting.rubocop,
    diagnostics.rubocop,
  },
})
