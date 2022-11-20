local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    max_name_length = 30,
    max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
    tab_size = 21,
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },  -- prevents tabs coliding with nvim-tree
    separator_style = "thin",
    enforce_regular_tabs = true,
  },
}
