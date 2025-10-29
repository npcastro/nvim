local lint = require('lint')

lint.linters_by_ft = {
  javascript = { 'eslint' },
  typescript = { 'eslint' },
  vue = { 'eslint' },
}

vim.api.nvim_create_autocmd({ 'BufWritePost', 'InsertLeave' }, {
  callback = function()
    lint.try_lint()
  end,
})
