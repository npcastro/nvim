local nvim_tree = require('nvim-tree')

-- to interact with the API
-- local config_status_ok, nvim_tree_api = pcall(require, "nvim-tree-api.config")
-- if not config_status_ok then
--   return
-- end

local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', 'p', api.node.open.preview, opts('Open: Preview'))

end

nvim_tree.setup {
  disable_netrw = true,
  hijack_cursor = true,
  diagnostics = {
    enable = true,
  },
  on_attach = on_attach,
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  view = {
    width = 40,
  },
}

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>")
