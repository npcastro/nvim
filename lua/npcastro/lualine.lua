local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

lualine.setup {
  options = { theme = 'auto' },
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1,
      }
    }
  }
}
