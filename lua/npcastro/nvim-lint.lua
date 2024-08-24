local lint = require('lint')

lint.linters_by_ft = {
  javascript = { 'volar', 'eslint' },
  ruby = { 'rubocop' },
  typescript = { 'volar', 'eslint' },
  vue = { 'volar', 'eslint' },
}

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
  callback = function()
    lint.try_lint()
  end,
})
