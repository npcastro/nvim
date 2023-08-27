local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"
local actions_layout = require("telescope.actions.layout")

telescope.setup {
  defaults = {

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "absolute" },
    preview = {
      hide_on_startup = true,
    },

    mappings = {
      i = {   -- insert mode mappings
        ["<C-c>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<C-r>"] = actions_layout.toggle_preview,
      },

      n = {   -- normal mode mappings
        ["<CR>"] = actions.select_default,
        ["<C-r>"] = actions_layout.toggle_preview,
      },
    },
    vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          -- "--smart-case",    -- do not asume case. Favors case sensitivity
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  },
}

vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files <cr>")
vim.keymap.set("n", "<leader>g", "<cmd>Telescope live_grep<cr>")
