local lualine = require('lualine')

lualine.setup {
  options = {
    theme = 'auto',
    globalstatus = true,
  },
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1,
      }
    }
  }
}
