local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  disable_netrw = true,
  hijack_cursor = true,
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  view = {
    width = 40,
    mappings = {
      list = {
        { key = { "l" }, cb = tree_cb "edit" },
        { key = { "h" }, cb = tree_cb "close_node" },
        { key = { "v" }, cb = tree_cb "vsplit" },
      },
    },
  },
}
